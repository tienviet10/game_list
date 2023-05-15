module Types
  module Game
    class GenrePlatformTagType < Types::BaseObject
      field :genres, [String], null: false
      field :platforms, [String], null: false
      field :tags, [String], null: false
      field :errors, [String], null: false
    end
  end
end
