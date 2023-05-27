class GameJournal < ApplicationRecord
  belongs_to :game
  belongs_to :user

  # alias_attribute :game_journal, :game_note
end
