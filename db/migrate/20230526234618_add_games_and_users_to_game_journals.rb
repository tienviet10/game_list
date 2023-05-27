class AddGamesAndUsersToGameJournals < ActiveRecord::Migration[6.1]
  def change
    drop_table :game_journals
  end
end
