module Mutations
  module Likes
    class AddLikeToLikeable < Mutations::BaseMutation
      description "Add a like to a likeable object"
      argument :likeable_id, ID, required: true
      argument :likeable_type, String, required: true

      field :like, Types::Like::LikeType, null: true
      field :errors, [String], null: true

      def resolve(likeable_id:, likeable_type:)
        if context[:current_user].nil?
          { like: nil, errors: ["Authentication required"] }
        else
          likeable = likeable_type.constantize.find_by(id: likeable_id)
          if likeable.nil?
            { like: nil, errors: ["Likeable not found"] }
          else
            like = Like.new(user_id: context[:current_user], likeable_id: likeable_id, likeable_type: likeable_type)

            # like: {
            #   id: like.id,
            #   likeable_id: status_update.id,
            #   likeable_type: "StatusUpdate",
            #   user_id: like.user_id,
            # }

            if like.save
              { like: like, errors: [] }
            else
              { like: nil, errors: ["Cannot add the new like on the same #{likeable_type}!"] }
            end
          end
        end
      end
    end
  end
end
