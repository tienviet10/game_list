module Types
  module User
    class FollowType < Types::BaseObject
      # field :id, ID, null: false
      # field :follower_id, ID, null: false
      # field :followed_id, ID, null: false
      # field :follower, Types::User::UserType, null: false
      # field :followed, Types::User::UserType, null: false

      # def follower
      #   ::User.find(object.follower_id)
      # end

      # def followed
      #   ::User.find(object.followed_id)
      # end

      field :id, ID, null: false
      field :followers, [Types::User::UserType], null: false
      field :followed_users, [Types::User::UserType], null: false

      def followers
        ::User.find(object.id).followers
      end

      def followed_users
        ::User.find(object.id).followed_users
      end
    end
  end
end
