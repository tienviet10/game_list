class RenameUserGameNotesToGameJournals < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_game_notes, :game_journals
    rename_column :game_journals, :game_note, :game_journal
  end
end
