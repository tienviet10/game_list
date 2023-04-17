module Queries
  module Game
    class GetAllGamesByTag < Queries::BaseQuery
      description "Get all games by tag"
      type [Types::Game::GameType], null: false

      argument :tag, Types::Input::TagAttributes, required: false
      argument :limit, Integer, required: false, default_value: 10, prepare: ->(limit, ctx) {[limit, 30].min}

      def resolve(tag:, limit:)
        start = ::Game.joins(:tags)
        start = start.where(tags: { name: tag.name }) if tag.name.present?
        start = start.where(tags: { id: tag.ID }) if tag.ID.present?
        start.limit(limit)
      end
    end
  end
end
