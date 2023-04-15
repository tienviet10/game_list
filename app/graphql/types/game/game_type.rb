# frozen_string_literal: true

module Types
  module Game
    class GameType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :description, String, null: false
      field :imageURL, String, null: false
      field :releaseDate, GraphQL::Types::ISO8601DateTime, null: false
      field :avg_score, Integer, null: false
      field :total_rating, Integer, null: false
      field :genres, [Types::Genre::GenreType], null: false
      field :tags, [Types::Tag::TagType], null: false
      field :platforms, [Types::Platform::PlatformType], null: false
    end
  end
end
