# frozen_string_literal: true

module Types
  module Genre
    class GenreType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :games, [Types::Game::GameType], null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
