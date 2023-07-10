module Mutations
  module Comments
    class EditCommentById < Mutations::BaseMutation
      description "Edit a comment by id"

      argument :comment_id, ID, required: true
      argument :body, String, required: true

      field :comment, Types::Comment::CommentType, null: true
      field :errors, [String], null: true

      def resolve(comment_id:, body:)
        if context[:current_user].nil?
          { comment: nil, errors: ["Authentication required"] }
        else
          comment = Comment.find_by(id: comment_id, user_id: context[:current_user])
          if comment.nil?
            { comment: nil, errors: ["Comment not found or not belong to the user."] }
          else
            if comment.user_id == context[:current_user]
              comment.body = body
              if comment.save
                { comment: comment, errors: [] }
              else
                { comment: nil, errors: comment.errors.full_messages }
              end
            else
              { comment: nil, errors: ["You are not authorized to edit this comment"] }
            end
          end
        end
      end
    end
  end
end
