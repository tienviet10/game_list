# frozen_string_literal: true

module Types
  module Platform
    class PlatformType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :games, [Types::Game::GameType], null: false
    end
  end
end
