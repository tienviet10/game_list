class GameJournal < ApplicationRecord
  belongs_to :user_game

  # alias_attribute :game_journal, :game_note
end
