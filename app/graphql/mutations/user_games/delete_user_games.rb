module Mutations
  module UserGames
    class DeleteUserGames < Mutations::BaseMutation
      argument :game_id, ID, required: true

      field :user_game, Types::UserGame::UserGameType, null: true
      field :errors, [String], null: true

      def resolve(game_id:)
        if context[:current_user].nil?
          { user_game: nil, errors: ["Authentication required"] }
        else
          user_game = UserGame.find_by(user_id: context[:current_user], game_id: game_id)
          if user_game
            user_game.destroy
            { user_game: user_game, errors: [] }
          else
            { user_game: nil, errors: ["User Game not found"] }
          end
        end
      end
    end
  end
end
