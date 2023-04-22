module Mutations
  module Users
    class LoginUser < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true

      field :user, Types::User::UserType, null: true
      field :token, String, null: true
      field :errors, [String], null: false

      def resolve(email:, password:)
        user = User.find_by(email: email)
        if user&.authenticate(password)
          token = JWT.encode({ user_id: user.id, exp: 30.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
          {
            user: user,
            token: token,
            errors: [],
          }
        else
          {
            user: {
              username: nil,
              email: nil,
            },
            token: nil,
            errors: GraphQL::ExecutionError.new("Invalid email or password"),
          }
        end
      end
    end
  end
end
