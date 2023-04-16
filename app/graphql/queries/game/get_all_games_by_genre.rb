module Queries
  module Game
    class GetAllGamesByGenre < Queries::BaseQuery
      description "Get all games by genre"
      type [Types::Game::GameType], null: false

      argument :genre, Types::Input::GenreAttributes, required: false
      argument :limit, Integer, required: false, default_value: 10, prepare: ->(limit, ctx) {[limit, 30].min}

      def resolve(genre:, limit:)
        start = ::Game.joins(:genres)
        start = start.where(genres: { name: genre.name }) if genre.name.present?
        start = start.where(genres: { id: genre.ID }) if genre.ID.present?
        start.limit(limit)
      end
    end
  end
end
