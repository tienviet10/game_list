module Types
  module User
    class FollowType < Types::BaseObject
      field :id, ID, null: false
      field :follower_id, ID, null: false
      field :followed_id, ID, null: false
      field :follower, Types::User::UserType, null: false
      field :followed, Types::User::UserType, null: false

      def follower
        ::User.find(object.follower_id)
      end

      def followed
        ::User.find(object.followed_id)
      end
    end
  end
end
