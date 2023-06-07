module Types
  module Game
    class GameFiltersType < Types::BaseObject
      field :genres, [String], null: false
      field :platforms, [String], null: false
      field :tags, [String], null: false
      field :year, Integer, null: false
      field :errors, [String], null: false
    end
  end
end
