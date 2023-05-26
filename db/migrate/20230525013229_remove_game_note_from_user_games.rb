class RemoveGameNoteFromUserGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_games, :game_note, :text
  end
end
