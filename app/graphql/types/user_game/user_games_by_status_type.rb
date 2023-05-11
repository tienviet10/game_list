# frozen_string_literal: true

module Types
  module UserGame
    class UserGamesByStatusType < Types::BaseObject
      field :playing, [Types::Game::GameType], null: true
      field :planning, [Types::Game::GameType], null: true
      field :completed, [Types::Game::GameType], null: true
      field :paused, [Types::Game::GameType], null: true
      field :dropped, [Types::Game::GameType], null: true
      field :playingCount, Integer, null: true
      field :planningCount, Integer, null: true
      field :completedCount, Integer, null: true
      field :pausedCount, Integer, null: true
      field :droppedCount, Integer, null: true
      field :erros, [String], null: true
    end
  end
end
