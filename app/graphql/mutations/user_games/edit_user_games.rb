module Mutations
  module UserGames
    class EditUserGames < Mutations::BaseMutation
      argument :game_id, ID, required: true
      argument :game_status, String, required: false
      argument :rating, Integer, required: false
      argument :game_note, String, required: false
      argument :private, Boolean, required: false
      argument :start_date, GraphQL::Types::ISO8601DateTime, required: false
      argument :completed_date, GraphQL::Types::ISO8601DateTime, required: false

      field :user_game, Types::UserGame::UserGameType, null: true
      field :errors, [String], null: true

      def resolve(game_id:, game_status: nil, rating: nil, game_note: nil, private: nil, start_date: nil, completed_date: nil)
        begin
          current_user = context[:current_user] unless context[:current_user].nil?
        rescue => e
          return { user_game: nil, errors: [e.message] }
        end

        userGame = UserGame.find_by(user_id: context[:current_user], game_id: game_id)
        if userGame.nil?
          user_game_new = UserGame.new(user_id: context[:current_user], game_id: game_id)

          user_game_new.rating = rating unless rating.nil?
          user_game_new.game_status = game_status unless game_status.nil?
          user_game_new.game_note = game_note unless game_note.nil?
          user_game_new.private = private unless private.nil?
          user_game_new.start_date = start_date unless start_date.nil?
          user_game_new.completed_date = completed_date unless completed_date.nil?

          if user_game_new.save
            { user_game: user_game_new, errors: [] }
          else
            { user_game: nil, errors: user_game_new.errors.full_messages }
          end
        else
          begin
            userGame.game_status = game_status unless game_status.nil?
          rescue ArgumentError => e
            return { user_game: nil, errors: [e.message] }
          end
          userGame.rating = rating unless rating.nil?

          userGame.game_note = game_note unless game_note.nil?
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
