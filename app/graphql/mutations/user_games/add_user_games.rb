module Mutations
  module UserGames

    class AddUserGames < Mutations::BaseMutation

      argument :user_id, ID, required: true
      argument :game_id, ID, required: true
      # argument :game_status, String, required: true
      # argument :game_note, String, required: true
      # argument :start_date, String, required: true
      # argument :completed_date, String, required: true
      # argument :private, Boolean, required: true
      # argument :rating, Float, required: true
      # argument :review, String, required: true

      field :user_game, Types::UserGame::UserGameType, null: true
      field :errors, [String], null: true

      def resolve(user_id:, game_id:)

        if UserGame.find_by(user_id: user_id, game_id: game_id)
           {user_game: nil, errors: ["User Game already exists"]}
        else
          user_game = UserGame.new(user_id: user_id, game_id: game_id)

          if user_game.save
            {user_game: user_game, errors: []}
          else
            {user_game: nil, errors: user_game.errors.full_messages}
          end

        end
      end

    end

  end
end
