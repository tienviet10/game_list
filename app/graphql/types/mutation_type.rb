module Types
  class MutationType < Types::BaseObject
    field :register, mutation: Mutations::Users::RegisterUser
<<<<<<< HEAD
    field :update_user, mutation: Mutations::Users::UpdateUser
=======
    field :login, mutation: Mutations::Users::LoginUser
>>>>>>> f6b0464466ced84868e38a84377293edff01f924

    field :add_user_games, mutation: Mutations::UserGames::AddUserGames
    field :delete_user_games, mutation: Mutations::UserGames::DeleteUserGames
  end
end
