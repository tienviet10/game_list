module Queries
  module Like
    class GetAllLikedGames < Queries::BaseQuery
      description "Get all liked games for a user by current_user"

      type [Types::Like::LikeType], null: false

      def resolve
        current_user = ::User.find_by(id: context[:current_user])
        if current_user
          current_user.likes.where(likeable_type: "Game")
        else
          raise GraphQL::ExecutionError, "User not authenticated"
        end
      end
    end
  end
end
