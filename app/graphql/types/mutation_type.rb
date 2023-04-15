module Types
  class MutationType < Types::BaseObject
    # field :create_user, mutation: Mutations::Users::CreateUser
    # field :create_post, mutation: Mutations::Posts::CreatePost
    # field :login, mutation: Mutations::Users::Login
    # field :register, mutation: Mutations::Users::Registration

    # TODO: remove me
    field :register, mutation: Mutations::Users::RegisterUser
  end
end
