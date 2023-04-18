module Queries
  module UserGames
    class GamesForAUser < Queries::BaseQuery
      description "Get a list of games for a user"
      type [Types::Game::GameType], null: false

      def resolve
        UserGame.where(user_id: context[:current_user]).map(&:game)
      end
    end
  end
end
