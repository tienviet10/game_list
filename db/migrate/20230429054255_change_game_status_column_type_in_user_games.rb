class ChangeGameStatusColumnTypeInUserGames < ActiveRecord::Migration[6.1]
  def up
    change_column :user_games, :game_status, :game_status
  end

  def down
    change_column :user_games, :game_status, :string
  end
end
