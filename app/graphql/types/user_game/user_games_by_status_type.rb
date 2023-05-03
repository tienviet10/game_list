# frozen_string_literal: true

module Types
  module UserGame
    class UserGamesByStatusType < Types::BaseObject
      field :playing, [Types::Game::GameType], null: false
      field :planning, [Types::Game::GameType], null: false
    end
  end
end
