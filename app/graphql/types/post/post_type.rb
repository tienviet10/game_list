module Types
  module Post
    class PostType < Types::BaseObject
      field :id, ID, null: false
      field :text, String, null: false
      field :user, Types::User::UserType, null: false
      field :user_id, String, null: false
      field :user_picture, String, null: false
      field :username, String, null: false

      field :liked_users, [Types::User::UserType], null: false
      field :likes_count, Integer, null: false

      field :comments, [Types::Comment::CommentType], null: false

      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

      def username
        ::User.find(object.user_id).username
      end

      def user
        ::User.find(object.user_id)
      end

      def user_id
        ::User.find(object.user_id).id
      end

      def user_picture
        ::User.find(object.user_id).user_picture
      end

      def likes_count
        object.likes.count
      end

      def liked_users
        object.likes.map(&:user)
      end

      def comments
        object.comments
      end
    end
  end
end
