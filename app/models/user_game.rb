class UserGame < ApplicationRecord
  # enum game_status: [ :active, :archived ]

  belongs_to :user
  belongs_to :game
end
