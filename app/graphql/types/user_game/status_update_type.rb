module Types
  module UserGame
    class StatusUpdateType < Types::BaseObject
      field :id, ID, null: false
      field :username, String, null: false
      field :user_id, String, null: false
      field :user_picture, String, null: false
      field :status, String, null: true
      field :game_name, String, null: false
      field :game_id, ID, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :imageURL, String, null: false

      field :liked_users, [Types::User::UserType], null: false
      field :likes_count, Integer, null: false

      def username
        ::User.find(object.user_game.user_id).username
      end

      def user_id
        ::User.find(object.user_game.user_id).id
      end

      def user_picture
        ::User.find(object.user_game.user_id).user_picture
      end

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
