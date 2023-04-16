module Mutations
  module Users
    class RegisterUser < Mutations::BaseMutation
      argument :username, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true

      field :user, Types::User::UserType, null: true
      field :token, String, null: false
      field :errors, [String], null: true

      def resolve(username:, email:, password:)
        user = User.new(username: username, email: email, password: password, is_active: true)
        if user.save
          token = JWT.encode({ user_id: user.id, exp: 7.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
          {
            user: user,
            token: token,
            errors: [],
          }
        else
          {
            user: {
              username: nil,
              email: nil,
            },
            token: nil,
            errors: user.errors.full_messages,
          }
        end
      end
    end
  end
end
