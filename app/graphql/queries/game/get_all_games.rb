
module Queries
  module Game
    class GetAllGames < Queries::BaseQuery
      description 'Get all games'
      type [Types::Game::GameType], null: false

      def resolve
        res = ::Game.all.map do |game|
          {
            name: game.name,
            tags: game.tags.pluck(:name),
            genres: game.genres.pluck(:name),
            platforms: game.platforms.pluck(:name)
          }
        end
        res
      end
    end

  end
end
