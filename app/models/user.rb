class User < ApplicationRecord
  has_secure_password

  before_save :set_default_values

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validate :password_presence_on_update, on: :update
  validates :password, length: { minimum: 6 }, on: :create

  has_many :user_games, dependent: :destroy
  has_many :games, through: :user_games

  has_many :follows, foreign_key: :follower_id, dependent: :destroy
  has_many :inverse_follows, foreign_key: :followed_id, class_name: "Follow", dependent: :destroy
  has_many :followed_users, through: :follows, source: :followed
  has_many :followers, through: :inverse_follows, source: :follower

  has_many :game_journals, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :posts, dependent: :destroy

  private

  def password_presence_on_update
    if password_digest_changed? && !password.present?
      errors.add(:password, "can't be blank")
    elsif password_digest_changed? && password.length < 6
      errors.add(:password, "is too short (minimum is 6 characters)")
    end
  end

  def set_default_values
    self.listsOrder ||= "planning,playing,completed,paused,dropped,justAdded"
  end
end
