module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Example:
    # field :users, resolver: Queries::Users::GetUsers
    # field :posts, resolver: Queries::Posts::Posts
    # field :games, resolver: Queries::Games::GamesByPlatform

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :all_games, resolver: Queries::Game::GetAllGames
    field :games_for_a_user, resolver: Queries::Game::GamesForAUser

    field :get_all_genres, resolver: Queries::Game::GetAllGenres
    field :get_all_platforms, resolver: Queries::Game::GetAllPlatforms
    field :get_all_tags, resolver: Queries::Game::GetAllTags

    field :get_all_games_by_platform, resolver: Queries::Game::GetAllGamesByPlatform

    field :get_all_users, resolver: Queries::User::GetAllUsers
  end
end
