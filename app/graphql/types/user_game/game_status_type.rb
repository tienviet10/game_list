module Types
  module UserGame
    class GameStatusType < Types::BaseObject
      field :status, String, null: false
      field :game_name, String, null: false
      field :game_id, ID, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

      # value "PLAYING", "Playing"
      # value "PLANNING", "Planning"
      # value "COMPLETED", "Completed"
      # value "PAUSED", "Paused"
      # value "DROPPED", "Dropped"
    end
  end
end
