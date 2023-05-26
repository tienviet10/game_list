module Queries
  module User
    class GetAllFollows < Queries::BaseQuery
      description "Get all follows for a user"
      type [Types::User::FollowType], null: false

      def resolve
        current_user = ::User.find_by(id: context[:current_user])

        if current_user
          current_user.follows
        else
          raise GraphQL::ExecutionError, "User not authenticated"
        end
      end
    end
  end
end
