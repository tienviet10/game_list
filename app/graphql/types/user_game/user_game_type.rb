# frozen_string_literal: true

module Types
  module UserGame
    class UserGameType < Types::BaseObject
      field :id, ID, null: false
      field :user, Types::User::UserType, null: false
      field :game, Types::Game::GameType, null: false
      field :game_status, String, null: false
      field :game_note, String, null: false
      field :start_date, GraphQL::Types::ISO8601DateTime, null: false
      field :completed_date, GraphQL::Types::ISO8601DateTime, null: false
      field :private, Boolean, null: false
      field :rating, Integer, null: false
      field :review, String, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
