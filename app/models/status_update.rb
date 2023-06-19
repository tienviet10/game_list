class StatusUpdate < ApplicationRecord
  belongs_to :user_game

  has_many :likes, as: :likeable, dependent: :destroy

  has_many :comments, as: :commentable, dependent: :destroy
end
