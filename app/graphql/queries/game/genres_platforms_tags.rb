module Queries
  module Game
    class GenresPlatformsTags < Queries::BaseQuery
      description "Get all genres, platforms, and tags"
      type Types::Game::GenrePlatformTagType, null: false

      def resolve
        {
          genres: ::Genre.all.map(&:name),
          platforms: ::Platform.all.map(&:name),
          tags: ::Tag.all.map(&:name),
          errors: [],
        }
      rescue StandardError => e
        {
          genres: nil,
          platforms: nil,
          tags: nil,
          errors: ["Failed to retrieve genres, platforms, or tags: #{e.message}"],
        }
      end
    end
  end
end
