module Mutations
  module Users
    class LoginUser < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true

      field :user, Types::User::UserType, null: false
      field :errors, [String], null: false

      def resolve(email:, password:)
        user = User.find_by(email: email)
        if user&.authenticate(password)
          {
            user: user,
            errors: [],
          }
        else
          p "Error: Invalid email or password"
          {
            user: {
              username: nil,
              email: nil,
            },
            errors: GraphQL::ExecutionError.new("Invalid email or password"),
          }
        end
      end
    end
  end
end
