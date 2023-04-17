module Queries
  module Game
    class GetAllTags < Queries::BaseQuery
      description "Get all tags"
      type [Types::Game::TagType], null: false

      def resolve
        ::Tag.all
      end
    end
  end
end
