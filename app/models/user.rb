class User < ApplicationRecord
  has_secure_password

  before_save :set_default_values

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validate :password_presence_on_update, on: :update
  validates :password, length: { minimum: 6 }, on: :create

  has_many :user_games
  has_many :games, through: :user_games

  private

  def password_presence_on_update
    if password_digest_changed? && !password.present?
      errors.add(:password, "can't be blank")
    elsif password_digest_changed? && password.length < 6
      errors.add(:password, "is too short (minimum is 6 characters)")
    end
  end

  def set_default_values
    self.listsOrder ||= "planning,playing,completed,paused,dropped"
  end
end
