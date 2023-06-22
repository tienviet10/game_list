module Types
  module User
    class FollowType < Types::BaseObject
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
