module Mutations
  module UserGames
    class DeleteUserGames < Mutations::BaseMutation

      argument :user_id, ID, required: true
      argument :game_id, ID, required: true

      field :user_game, Types::UserGame::UserGameType, null: true
      field :errors, [String], null: true

      def resolve(user_id:, game_id:)
        user_game = UserGame.find_by(user_id: user_id, game_id: game_id)
        if user_game
          user_game.destroy
          {user_game: user_game, errors: []}
        else
          {user_game: nil, errors: ["User Game not found"]}
        end

      end

    end
  end
end
