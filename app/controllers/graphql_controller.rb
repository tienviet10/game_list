class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session
  before_action :verify_jwt_token

  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      current_user: @current_user,
    }
    result = GameListBeSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development(e)
  end

  private

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end

  # Verify JWT token
  def verify_jwt_token
    if params[:query].include?("login") || params[:query].include?("register") || params[:query].include?("IntrospectionQuery")
      @current_user = nil
      return
    end

    token = request.headers["Authorization"]&.split&.last
    if token
      decoded_token = JWT.decode(token, ENV["SECRET_KEY_BASE"], true, { algorithm: "HS256" })
      if decoded_token[0]["user_id"].present? && decoded_token[0]["exp"] > Time.now.to_i
        @current_user = decoded_token[0]["user_id"]
        return
      end
    end

    if %w[GetAllGames GetGameFilters GetGameById].include?(params[:operationName])
      @current_user = nil
      return
    end

    @current_user = nil
    raise GraphQL::ExecutionError, "Invalid token"
  rescue JWT::DecodeError, GraphQL::ExecutionError => e
    render json: { error: "Unauthorized", message: "Please login again" }, status: :unauthorized
  end
end
