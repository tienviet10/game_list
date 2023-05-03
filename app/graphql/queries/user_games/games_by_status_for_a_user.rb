module Queries
  module UserGames
    class GamesByStatusForAUser < Queries::BaseQuery
      description "Get games by status for a user"
      argument :status, String, required: false
      type [Types::Game::GameType], null: false

      def resolve(status:)
        ::UserGame.where(game_status: status, user_id: context[:current_user]).map(&:game)
      end
    end
  end
end
