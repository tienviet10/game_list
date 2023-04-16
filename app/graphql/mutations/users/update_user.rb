module Mutations
  module Users
    class UpdateUser < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :username, String, required: false
      argument :email, String, required: false
      argument :password, String, required: false

      field :user, Types::User::UserType, null: false
      field :errors, [String], null: false

      def resolve(id:, username:, email:, password:)
        user = User.find(id)
        if user
          user.update(username: username, email: email, password: password)
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
