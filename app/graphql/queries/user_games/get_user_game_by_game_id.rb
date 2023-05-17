module Queries
  module UserGames
    class GetUserGameByGameId < Queries::BaseQuery
      description "Get a user game by game id and user id (current user)"

      argument :game_id, ID, required: true

      type Types::UserGame::UserGameType, null: false

      def resolve(game_id:)
        UserGame.where(user_id: context[:current_user], game_id: game_id).first
      end
    end
  end
end
