# frozen_string_literal: true

module Types
  module User
    class UserType < Types::BaseObject
      field :id, ID, null: false
      field :username, String, null: true
      field :email, String, null: true
      field :banner_picture, String, null: true
      field :user_picture, String, null: true
      field :is_active, Boolean, null: true
      field :listsOrder, String, null: true
      field :user_games, [Types::UserGame::UserGameType], null: false
      field :games, [Types::Game::GameType], null: false

      field :followed_users, [Types::User::UserType], null: false
      field :followers, [Types::User::UserType], null: false

      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
