class UserGame < ApplicationRecord
  include PGEnum(game_status: %w[Playing Completed Paused Planning Dropped Inactive])

  before_save :set_default_values

  def set_default_values
    self.game_status ||= nil
    self.start_date ||= nil
    self.completed_date ||= nil
    self.private ||= false
    self.rating ||= 0
    self.game_note ||= ""
  end

  belongs_to :user
  belongs_to :game

  has_many :status_updates, dependent: :destroy

  # HERE IS THE MAGIC THAT CREATE OR UPDATE THE USERGAME WILL CREATE A STATUS UPDATE
  after_create :create_initial_status_update
  after_update :create_status_update_on_status_change

  def create_initial_status_update
    create_status_update
  end

  def create_status_update_on_status_change
    return unless saved_change_to_game_status?
    p "status changed"
    create_status_update
  end

  private

  def create_status_update
    status_updates.create(status: game_status, user_game: self)
  end
end
