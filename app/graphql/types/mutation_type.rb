module Types
  class MutationType < Types::BaseObject
    field :register, mutation: Mutations::Users::RegisterUser
    field :update_user, mutation: Mutations::Users::UpdateUser
    field :login, mutation: Mutations::Users::LoginUser

    field :add_user_games, mutation: Mutations::UserGames::AddUserGames
    field :delete_user_games, mutation: Mutations::UserGames::DeleteUserGames
    field :edit_user_games, mutation: Mutations::UserGames::EditUserGames

    field :add_follows_by_id, mutation: Mutations::Users::AddFollowsById
    field :remove_follows_by_id, mutation: Mutations::Users::RemoveFollowsById

    field :add_like_to_likeable, mutation: Mutations::Likes::AddLikeToLikeable
    field :remove_like_from_likeable, mutation: Mutations::Likes::RemoveLikeFromLikeable

    field :add_comment_to_commentable, mutation: Mutations::Comments::AddCommentToCommentable
    field :remove_comment_from_commentable, mutation: Mutations::Comments::RemoveCommentFromCommentable
    field :edit_comment_by_id, mutation: Mutations::Comments::EditCommentById

    field :create_post, mutation: Mutations::Posts::CreatePost
  end
end
