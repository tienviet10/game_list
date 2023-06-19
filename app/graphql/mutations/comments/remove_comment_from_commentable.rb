module Mutations
  module Comments
    class RemoveCommentFromCommentable < Mutations::BaseMutation
      description "Removes a comment from commentable object"

      argument :commentable_id, ID, required: true
      argument :commentable_type, String, required: true

      field :comment, Types::Comment::CommentType, null: true
      field :errors, [String], null: true

      def resolve(commentable_id:, commentable_type:)
        if context[:current_user].nil?
          { comment: nil, errors: ["Authentication required"] }
        else
          commentable = commentable_type.constantize.find_by(id: commentable_id)
          if commentable.nil?
            { comment: nil, errors: ["Commentable object not found"] }
          else
            comment = Comment.find_by(user_id: context[:current_user], commentable_id: commentable_id, commentable_type: commentable_type)

            if comment.nil?
              { comment: nil, errors: ["Comment not found"] }
            else
              comment.destroy
              { comment: comment, errors: [] }
            end
          end
        end
      end
    end
  end
end
