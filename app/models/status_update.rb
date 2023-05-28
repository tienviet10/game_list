class StatusUpdate < ApplicationRecord
  belongs_to :user_game
  belongs_to :status
end
