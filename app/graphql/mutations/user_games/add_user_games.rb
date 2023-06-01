module Mutations
  module UserGames
    class AddUserGames < Mutations::BaseMutation
      description "Add a game to user's list according to user_id and game_id"
      argument :game_id, ID, required: true

      field :user_game, Types::UserGame::UserGameType, null: true
      field :errors, [String], null: true

      def resolve(game_id:)
        if context[:current_user].nil?
          { user_game: nil, errors: ["Authentication required"] }
        elsif UserGame.find_by(user_id: context[:current_user], game_id: game_id).present?
          user_game = UserGame.find_by(user_id: context[:current_user], game_id: game_id)
          if user_game.game_status == "Inactive"
            user_game.game_status = nil
            user_game.game_note = nil
            user_game.rating = nil
            user_game.private = nil
            user_game.start_date = nil
            user_game.completed_date = nil
            user_game.save
            { user_game: user_game, errors: [] }
          else
            { user_game: nil, errors: ["User Game already exists"] }
          end
        else
          user_game_new = UserGame.new(user_id: context[:current_user], game_id: game_id)
          if user_game_new.save
            { user_game: user_game_new, errors: [] }
          else
            { user_game: nil, errors: ["Cannot add the new game!"] }
          end
        end
      end
    end
  end
end
