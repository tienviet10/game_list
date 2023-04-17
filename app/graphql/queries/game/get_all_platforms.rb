module Queries
  module Game
    class GetAllPlatforms < Queries::BaseQuery
      description "Get all platforms"
      type [Types::Game::PlatformType], null: false

      def resolve
        ::Platform.all
      end
    end
  end
end
