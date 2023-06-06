module Mutations
  module Posts
    class CreatePost < Mutations::BaseMutation
      description "Create a new post"

      argument :text, String, required: true

      field :post, Types::Post::PostType, null: true
      field :errors, [String], null: true

      def resolve(text:)
        if context[:current_user].nil?
          { post: nil, errors: ["Authentication required"] }
        else
          post = Post.new(text: text, user_id: context[:current_user])

          if post.save
            { post: post, errors: [] }
          else
            { post: nil, errors: post.errors.full_messages }
          end
        end
      end
    end
  end
end
