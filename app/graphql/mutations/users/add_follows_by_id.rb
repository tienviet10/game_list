module Mutations
  module Users
    class AddFollowsById < Mutations::BaseMutation
      description "Add a follow to user's list according to follower_id and followed_id"

      argument :followed_id, ID, required: true

      field :follow, Types::User::FollowType, null: true
      field :errors, [String], null: true

      def resolve(followed_id:)
        begin
          current_user = User.find_by(id: context[:current_user]) unless context[:current_user].nil?
        rescue => e
          return { follow: nil, errors: [e.message] }
        end

        # CAN NOT FOLLOW YOURSELF
        # if context[:current_user].equal?(followed_id)
        if current_user&.id == followed_id.to_i
          return { follow: nil, errors: ["Cannot follow yourself"] }
        end

        # HAVE TO BE A VALID USER
        followed_user = User.find_by(id: followed_id)
        if followed_user.nil?
          return { follow: nil, errors: ["User not found"] }
        end

        if current_user.nil?
          return { follow: nil, errors: ["Authentication required"] }
        elsif Follow.find_by(follower_id: current_user.id, followed_id: followed_id).present?
          return { follow: nil, errors: ["Follow already exists"] }
        else
          follow = Follow.new(follower_id: current_user.id, followed_id: followed_id)
          if follow.save
            return { follow: current_user, errors: [] }
          else
            return { follow: nil, errors: ["Cannot add the new follow!"] }
          end
        end
      end
    end
  end
end
