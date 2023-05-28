module Types
  module UserGame
    class GameStatusType < Types::BaseObject
      field :status, String, null: false
      field :game_name, String, null: false
      field :game_id, ID, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :imageURL, String, null: false
    end
  end
end
