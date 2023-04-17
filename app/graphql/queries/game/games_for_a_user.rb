module Queries
  module Game
    class GamesForAUser < Queries::BaseQuery
      description "Get a list of games for a user"
      type [Types::Game::GameType], null: false

      def resolve
        UserGame.where(user_id: context[:current_user]).map(&:game)

        # games = UserGame.where(user_id: 2)
        # p games
        # games.map do |game|
        #   game.game
        # end
      end
    end
  end
end
