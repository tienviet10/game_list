module Queries
  module Game
    class GetGameFilters < Queries::BaseQuery
      description "Get all genres, platforms, tags and furthest year"
      type Types::Game::GameFiltersType, null: false

      def resolve
        # The rescue is to prevent the query from failing if the database is empty
        furthestYear = ::Game.order('"releaseDate"').last.releaseDate.year rescue Date.current.year
        {
          genres: ::Genre.all.map(&:name),
          platforms: ::Platform.all.map(&:name),
          tags: ::Tag.all.map(&:name),
          year: furthestYear,
          errors: [],
        }
      rescue StandardError => e
        {
          genres: nil,
          platforms: nil,
          tags: nil,
          year: nil,
          errors: ["Failed to retrieve genres, platforms, or tags: #{e.message}"],
        }
      end
    end
  end
end
