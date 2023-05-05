module Queries
  module Game
    class GetAllGames < Queries::BaseQuery
      description "Get all games"
      type [Types::Game::GameType], null: false

      argument :platform, [String], required: false
      argument :genre, [String], required: false
      argument :tag, [String], required: false

      def resolve(platform: nil, genre: nil, tag: nil)
        allGames = ::Game.all

        # Return games by platform if platform argument is provided
        if (platform.present?)
          allGames = allGames.joins(:platforms).where(platforms: { name: platform })
        end

        # Return games by genre if genre argument is provided
        if (genre.present?)
          allGames = allGames.joins(:genres).where(genres: { name: genre })
        end

        # Return games by tag if tag argument is provided
        if (tag.present?)
          allGames = allGames.joins(:tags).where(tags: { name: tag })
        end

        return allGames.uniq
      end
    end
  end
end
