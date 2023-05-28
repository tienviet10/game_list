module Mutations
  module Likes
    class RemoveLikeFromLikeable < Mutations::BaseMutation
      description "Removes a like from likeable object"

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
            { like: nil, errors: ["Likeable object not found"] }
          else
            like = Like.find_by(user_id: context[:current_user], likeable_id: likeable_id, likeable_type: likeable_type)

            if like.nil?
              { like: nil, errors: ["Like not found"] }
            else
              like.destroy
              { like: like, errors: [] }
            end
          end
        end
      end
    end
  end
end
