class UserGame < ApplicationRecord
  include PGEnum(game_status: %w[Playing Completed Paused Planning Dropped])

  before_save :set_default_values

  def set_default_values
    self.game_status ||= nil
    self.start_date ||= nil
    self.completed_date ||= nil
    self.private ||= false
    self.rating ||= 0
    self.review ||= ""
  end

  has_many :user_game_notes
  belongs_to :user
  belongs_to :game
end
