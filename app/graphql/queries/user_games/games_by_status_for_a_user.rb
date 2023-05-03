module Queries
  module UserGames
    class GamesByStatusForAUser < Queries::BaseQuery
      description "Get games by status for a user"
      type Types::UserGame::UserGamesByStatusType, null: false

      def resolve()
        {
          "playing" => ::UserGame.where(user_id: context[:current_user], game_status: :Playing).map(&:game),
          "planning" => ::UserGame.where(user_id: context[:current_user], game_status: :Planning).map(&:game),
          "completed" => ::UserGame.where(user_id: context[:current_user], game_status: :Completed).map(&:game),
          "paused" => ::UserGame.where(user_id: context[:current_user], game_status: :Paused).map(&:game),
          "dropped" => ::UserGame.where(user_id: context[:current_user], game_status: :Dropped).map(&:game),
        }
      end
    end
  end
end
