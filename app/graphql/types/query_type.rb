module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :all_games, resolver: Queries::Game::GetAllGames
    field :games_for_a_user, resolver: Queries::UserGames::GamesForAUser
    field :games_by_status_for_a_user, resolver: Queries::UserGames::GamesByStatusForAUser
    field :get_user_game_by_game_id, resolver: Queries::UserGames::GetUserGameByGameId

    field :get_game_filters, resolver: Queries::Game::GetGameFilters

    field :get_all_games_by_platform, resolver: Queries::Game::GetAllGamesByPlatform
    field :get_all_games_by_genre, resolver: Queries::Game::GetAllGamesByGenre
    field :get_all_games_by_tag, resolver: Queries::Game::GetAllGamesByTag

    field :get_all_users, resolver: Queries::User::GetAllUsers
    field :get_user_by_id, resolver: Queries::User::GetUserById
  end
end
