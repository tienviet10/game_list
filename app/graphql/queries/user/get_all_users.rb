module Queries
  module User
    class GetAllUsers < Queries::BaseQuery
      description 'Get all users'
      type [Types::User::UserType], null: false

      def resolve
        ::User.all
      end
    end
  end
end


