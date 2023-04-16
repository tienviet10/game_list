 module Mutations
  module Users
    class UpdateUser < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :username, String, required: false
      argument :email, String, required: false
      argument :password, String, required: false

      field :user, Types::User::UserType, null: true
      field :errors, [String], null: true

      def resolve(id:, username:, email:, password:)
        user = User.find(id)
        if user
          # Update user attributes only if they are provided
          user.update(password: password) if password.present?
          user.update(username: username) if username.present?
          user.update(email: email) if email.present?

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
        else
          {
            user: nil,
            errors: ["User not found"],
          }
        end
      end
    end
  end
end
