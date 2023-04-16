module Queries
  module Game
    class GetAllGenres < Queries::BaseQuery
      description "Get all genres"
      type [Types::Game::GenreType], null: false

      def resolve
        ::Genre.all
      end
    end
  end
end
