module Types
  module Like
    class LikeType < Types::BaseObject
      field :id, ID, null: false
      field :likeable_id, ID, null: false
      field :likeable_type, String, null: false
      field :user_id, ID, null: false
      field :user, Types::User::UserType, null: false
      field :likeable, Types::Like::LikeableType, null: false

      def user
        ::User.find(object.user_id)
      end

      def likeable
        p "object.likeable_type: #{object}"
        object.likeable_type.constantize.find(object.likeable_id)
      end
    end
  end
end
