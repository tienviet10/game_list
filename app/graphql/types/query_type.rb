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
    field :get_all_games, resolver: Queries::Game::GetAllGames

    field :get_all_users, resolver: Queries::User::GetAllUsers
    # field :get_user_by_id, resolver: Queries::User::GetUserById
  end
end
