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

      field :is_game_added, Boolean, null: false
      field :genres, [String], null: false
      field :tags, [String], null: false
      field :platforms, [String], null: false

      def is_game_added
        result = object.user_games.where(user_id: context[:current_user]).exists? && object.user_games.find_by(user_id: context[:current_user]).game_status != "Inactive"

        result
      end

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
