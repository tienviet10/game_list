module Mutations
  module UserGames
    class EditUserGames < Mutations::BaseMutation
      argument :game_id, ID, required: true
      argument :game_status, String, required: false
      argument :rating, Integer, required: false
      # argument :game_note, String, required: false
      argument :review, String, required: false
      argument :private, Boolean, required: false
      argument :start_date, GraphQL::Types::ISO8601DateTime, required: false
      argument :completed_date, GraphQL::Types::ISO8601DateTime, required: false
      # CREATE NEW INSTANCE OF USER_GAME_NOTE IF EXIST
      argument :user_game_note, String, required: false

      field :user_game, Types::UserGame::UserGameType, null: true
      field :errors, [String], null: true

      def resolve(game_id:, game_status: nil, rating: nil, user_game_note: nil, review: nil, private: nil, start_date: nil, completed_date: nil)
        begin
          current_user = context[:current_user] unless context[:current_user].nil?
        rescue => e
          return { user_game: nil, errors: [e.message] }
        end

        userGame = UserGame.find_by(user_id: context[:current_user], game_id: game_id)
        if userGame.nil?
          { user_game: nil, errors: ["User Game not found"] }
        else
          begin
            userGame.game_status = game_status unless game_status.nil?
          rescue ArgumentError => e
            return { user_game: nil, errors: [e.message] }
          end
          userGame.rating = rating unless rating.nil?
          # userGame.game_note = game_note unless game_note.nil?
          if user_game_note.present?
            user_game_note_1 = UserGameNote.new(game_note: user_game_note)
            userGame.user_game_notes << user_game_note_1
          end

          userGame.review = review unless review.nil?
          userGame.private = private unless private.nil?
          userGame.start_date = start_date unless start_date.nil?
          userGame.completed_date = completed_date unless completed_date.nil?
          if userGame.save
            { user_game: userGame, errors: [] }
          else
            { user_game: nil, errors: userGame.errors.full_messages }
          end
        end
      end
    end
  end
end
