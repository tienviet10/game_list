module Mutations
  module Users
    class RegisterUser < Mutations::BaseMutation
      argument :username, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true

      field :user, Types::User::UserType, null: true
      field :token, String, null: true
      field :errors, [String], null: false

      def resolve(username:, email:, password:)
        user = User.new(username: username, email: email, password: password, is_active: true)
        if user.save
          token = JWT.encode({ user_id: user.id, exp: 30.days.from_now.to_i }, ENV["SECRET_KEY_BASE"])
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
            # errors: user.errors.full_messages,
            errors: GraphQL::ExecutionError.new("Email is already taken"),
          }
        end
      end
    end
  end
end
