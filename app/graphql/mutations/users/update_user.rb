module Mutations
  module Users
    class UpdateUser < Mutations::BaseMutation
      argument :payload, GraphQL::Schema::Scalar, required: true
      argument :action, String, required: true

      field :user, Types::User::UserType, null: true
      field :errors, [String], null: true

      def resolve(payload:, action:)
        user = User.find(context[:current_user])
        if user
          case action
          when "password"
            user.update(password: payload)
          when "email"
            user.update(email: payload)
          when "username"
            user.update(username: payload)
          when "is_active"
            user.update(is_active: payload)
          else
            return {
                     user: nil,
                     errors: ["Invalid action"],
                   }
          end

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
