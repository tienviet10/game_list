module Queries
  module UserGames
    class GetUserGameByGameId < Queries::BaseQuery
      description "Get a user game by game id and user id (current user)"
      type [Types::UserGame::UserGameType], null: false

      argument :game_id, ID, required: true

      def resolve(game_id:)
        UserGame.where(user_id: context[:current_user], game_id: game_id)
      end
    end
  end
end
