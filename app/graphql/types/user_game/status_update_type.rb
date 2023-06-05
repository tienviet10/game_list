module Types
  module UserGame
    class StatusUpdateType < Types::BaseObject
      field :id, ID, null: false
      field :status, String, null: true
      field :game_name, String, null: false
      field :game_id, ID, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :imageURL, String, null: false

      field :liked_users, [Types::User::UserType], null: false
      field :likes_count, Integer, null: false

      def likes_count
        object.likes.count
      end

      def liked_users
        object.likes.map(&:user)
      end

      def game_name
        ::UserGame.find(object.user_game_id).game.name
      end

      def game_id
        ::UserGame.find(object.user_game_id).game.id
      end

      def imageURL
        ::UserGame.find(object.user_game_id).game.imageURL
      end
    end
  end
end
