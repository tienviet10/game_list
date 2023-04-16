module Mutations
  module UserGames

    class AddUserGames < Mutations::BaseMutation

      argument :user_id, ID, required: true
      argument :game_id, ID, required: true
      argument :game_status, String, required: true
      argument :game_note, String, required: true
      argument :start_date, String, required: true
      argument :completed_date, String, required: true
      argument :private, Boolean, required: true
      argument :rating, Float, required: true
      argument :review, String, required: true

      field :user_game, Types::UserGame::UserGameType, null: false
      field :errors, [String], null: false

      def resolve(user_id:, game_id:, game_status:, game_note:, start_date:, completed_date:, private:, rating:, review:)
        user_game = UserGame.new(user_id: user_id, game_id: game_id, game_status: game_status, game_note: game_note, start_date: start_date, completed_date: completed_date, private: private, rating: rating, review: review)
        if user_game.save
          {user_game: user_game, errors: []}
        else
          {user_game: nil, errors: user_game.errors.full_messages}
        end
      end

    end

  end
end
