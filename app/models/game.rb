class Game < ApplicationRecord
  has_many :user_games
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :platforms


  has_many :users, through: :user_games
end
