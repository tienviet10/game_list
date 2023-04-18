module Queries
  module User
    class GetUserById < Queries::BaseQuery
      description "Get user by id"
      type Types::User::UserType, null: false

      def resolve()
        user = ::User.find_by(id: context[:current_user])

        if user
          user
        else
          raise GraphQL::ExecutionError, "User not found"
        end
      end
    end
  end
end
