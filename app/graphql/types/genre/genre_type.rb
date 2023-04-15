# frozen_string_literal: true

module Types
  module Genre
    class GenreType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :games, [Types::Game::GameType], null: false
    end
  end
end
