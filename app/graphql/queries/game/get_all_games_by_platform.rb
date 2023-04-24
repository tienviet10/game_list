module Queries
  module Game
    class GetAllGamesByPlatform < Queries::BaseQuery
      description "Get all games by platform"
      type [Types::Game::GameType], null: false

      argument :platform, Types::Input::EntityIdNameAttributes, required: false
      argument :limit, Integer, required: false, default_value: 10, prepare: ->(limit, ctx) { [limit, 30].min }

      def resolve(platform:, limit:)
        start = ::Game.joins(:platforms)
        start = start.where(platforms: { name: platform.name }) if platform.name.present?
        start = start.where(platforms: { id: platform.ID }) if platform.ID.present?
        start.limit(limit)
      end
    end
  end
end
