module Queries
  module Game
    class GetGameById < Queries::BaseQuery
      description "Get game by id"
      type Types::Game::GameType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        ::Game.find(id)
      end
    end
  end
end
