module Queries
  module Game
    class GetAllGames < Queries::BaseQuery
      description 'Get all games'
      type [Types::Game::GameType], null: false

      def resolve
        ::Game.all
      end
    end
  end
end
