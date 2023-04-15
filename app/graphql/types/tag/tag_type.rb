# frozen_string_literal: true

module Types
  module Tag
    class TagType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :games, [Types::Game::GameType], null: false
    end
  end
end
