# frozen_string_literal: true

module Types
  module User
    class UserType < Types::BaseObject
      field :id, ID, null: false
      field :username, String, null: false
      field :password_digest, String, null: false
      field :email, String, null: false
      field :banner_picture, String, null: false
      field :user_picture, String, null: false
      field :user_games, [Types::UserGame::UserGameType], null: false
      field :games, [Types::Game::GameType], null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
