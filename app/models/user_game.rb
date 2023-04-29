class UserGame < ApplicationRecord
  include PGEnum(game_status: %w[Playing Completed Paused Planning Dropped])

  before_save :set_default_values

  def set_default_values
    self.game_status ||= :Playing
    self.game_note ||= ""
    self.start_date ||= Time.now
    self.completed_date ||= Time.now + 1.day
    self.private ||= false
    self.rating ||= 0
    self.review ||= ""
  end

  belongs_to :user
  belongs_to :game
end
