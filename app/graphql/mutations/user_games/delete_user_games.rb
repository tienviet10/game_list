module Mutations
  module UserGames
    class DeleteUserGames < Mutations::BaseMutation

      argument :user_id, ID, required: true
      argument :game_id, ID, required: true

      field :user, Types::User::UserType, null: false
      field :errors, [String], null: false

      def resolve(user_id:, game_id:)
        user = User.find(user_id)


      end

    end
  end
end
