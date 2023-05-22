# frozen_string_literal: true

module Types
  module UserGame
    class UserGameType < Types::BaseObject
      field :id, ID, null: false
      field :game, Types::Game::GameType, null: false
      field :game_status, String, null: true
      field :game_note, String, null: true
      field :start_date, GraphQL::Types::ISO8601DateTime, null: true
      field :completed_date, GraphQL::Types::ISO8601DateTime, null: true
      field :private, Boolean, null: true
      field :rating, Float, null: true
      field :review, String, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
