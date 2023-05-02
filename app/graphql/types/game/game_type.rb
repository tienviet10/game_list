# frozen_string_literal: true

module Types
  module Game
    class GameType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :description, String, null: false
      field :imageURL, String, null: true
      field :bannerURL, String, null: true
      field :releaseDate, GraphQL::Types::ISO8601DateTime, null: false
      field :avg_score, Float, null: true
      field :total_rating, Integer, null: true

      field :genres, [String], null: false
      field :tags, [String], null: false
      field :platforms, [String], null: false

      def genres
        object.genres.map(&:name)
      end

      def platforms
        object.platforms.map(&:name)
      end

      def tags
        object.tags.map(&:name)
      end
    end
  end
end
