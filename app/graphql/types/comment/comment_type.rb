module Types
  module Comment
    class CommentType < Types::BaseObject
      field :id, ID, null: false
      field :body, String, null: false
      field :user_id, ID, null: false
      field :commentable_id, ID, null: false
      field :commentable_type, String, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

      field :user, Types::User::UserType, null: false
      field :commentable, Types::Comment::CommentableType, null: false

      def user
        ::User.find(object.user_id)
      end

      def commentable
        # When object.commentable_type = "Post"
        # object: {
        #   id: 1,
        #   body: "Nice Post!",
        #   user_id: 1,
        #   commentable_type: "Post",
        #   commentable_id: 1,
        #   created_at: Sun, 18 Jun 2023 17:12:36.998070000 UTC +00:00,
        #   updated_at: Sun, 18 Jun 2023 17:12:36.998070000 UTC +00:00>
        # }

        object.commentable_type.constantize.find(object.commentable_id)
      end
    end
  end
end
