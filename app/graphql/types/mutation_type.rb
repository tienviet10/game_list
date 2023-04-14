module Types
  class MutationType < Types::BaseObject
    # field :create_user, mutation: Mutations::Users::CreateUser
    # field :create_post, mutation: Mutations::Posts::CreatePost
    # field :login, mutation: Mutations::Users::Login
    # field :register, mutation: Mutations::Users::Registration

    # TODO: remove me
    field :test_field, String, null: false,
                           description: "An example field added by the generator"

    def test_field
      "Hello World"
    end
  end
end
