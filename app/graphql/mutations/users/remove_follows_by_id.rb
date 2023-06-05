module Mutations
  module Users
    class RemoveFollowsById < Mutations::BaseMutation
      description "Remove a follow in user's list according to follower_id and followed_id"
      argument :followed_id, ID, required: true

      field :follow, Types::User::FollowType, null: true
      field :errors, [String], null: true

      def resolve(followed_id:)
        if context[:current_user].nil?
          { follow: nil, errors: ["Authentication required"] }
        else
          follow = Follow.find_by(follower_id: context[:current_user], followed_id: followed_id)
          if follow
            follow.destroy
            current_user = User.find_by(id: context[:current_user])
            { follow: current_user, errors: [] }
          else
            { follow: nil, errors: ["Follow not found"] }
          end
        end
      end
    end
  end
end
