module Mutations
  module Comments
    class AddCommentToCommentable < Mutations::BaseMutation
      description "Add a comment to a commentable object"
      argument :commentable_id, ID, required: true
      argument :commentable_type, String, required: true
      argument :body, String, required: true

      field :comment, Types::Comment::CommentType, null: true
      field :errors, [String], null: true

      def resolve(commentable_id:, commentable_type:, body:)
        if context[:current_user].nil?
          { comment: nil, errors: ["Authentication required"] }
        else
          commentable = commentable_type.constantize.find_by(id: commentable_id)
          if commentable.nil?
            { comment: nil, errors: ["Commentable not found"] }
          else
            comment = Comment.new(user_id: context[:current_user], commentable_id: commentable_id, commentable_type: commentable_type, body: body)

            # comment: {
            #   id: 1,
            #   body: "Nice Post!",
            #   user_id: 1,
            #   commentable_type: "Post",
            #   commentable_id: 1,
            #   created_at: Sun, 18 Jun 2023 17:12:36.998070000 UTC +00:00,
            #   updated_at: Sun, 18 Jun 2023 17:12:36.998070000 UTC +00:00
            # }

            if comment.save
              { comment: comment, errors: [] }
            else
              { comment: nil, errors: ["Cannot add the new comment on this #{commentable_type}!"] }
            end
          end
        end
      end
    end
  end
end
