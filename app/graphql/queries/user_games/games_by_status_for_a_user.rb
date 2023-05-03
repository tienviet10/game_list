module Queries
  module UserGames
    class GamesByStatusForAUser < Queries::BaseQuery
      description "Get games by status for a user"
      type Types::UserGame::UserGamesByStatusType, null: false

      def resolve()
        raise GraphQL::ExecutionError, "User not authenticated" unless context[:current_user]
        begin
          {
            "playing" => fetch_games_by_status(:Playing),
            "planning" => fetch_games_by_status(:Planning),
            "completed" => fetch_games_by_status(:Completed),
            "paused" => fetch_games_by_status(:Paused),
            "dropped" => fetch_games_by_status(:Dropped),
          }
        rescue => e
          Rails.logger.error("Error retrieving games by status: #{e.message}")
          {
            "playing" => [],
            "planning" => [],
            "completed" => [],
            "paused" => [],
            "dropped" => [],
            "errors": e.message,
          }
        end
      end

      private

      def fetch_games_by_status(status)
        ::UserGame.where(user_id: context[:current_user], game_status: status).map(&:game)
      end
    end
  end
end
