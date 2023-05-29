class StatusUpdate < ApplicationRecord
  belongs_to :user_game
  belongs_to :status
  has_many :likes, as: :likeable, dependent: :destroy
  # has_many :status_update_likes, dependent: :destroy
end
