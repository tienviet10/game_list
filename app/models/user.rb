class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  has_many :user_games
  has_many :games, through: :user_games
end
