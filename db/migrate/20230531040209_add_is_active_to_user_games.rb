class AddIsActiveToUserGames < ActiveRecord::Migration[6.1]
  def change
    add_column :user_games, :is_active, :boolean, default: true
  end
end
