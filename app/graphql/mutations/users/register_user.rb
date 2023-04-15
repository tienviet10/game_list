module Mutations
  module Users
    class RegisterUser < Mutations::BaseMutation
      argument :username, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true

      field :user, Types::User::UserType, null: false
      field :errors, [String], null: false

      def resolve(username:, email:, password:)
        user = User.new(username: username, email: email, password: password, is_active: true)
        if user.save
          {
            user: user,
            errors: [],
          }
        else
          {
            user: nil,
            errors: user.errors.full_messages,
          }
        end
      end
    end
  end
end
