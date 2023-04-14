class Game < ApplicationRecord
  has_many :user_games
  has_many :tags
  has_many :platforms
  has_many :genres

  has_many :users, through: :user_games
end
