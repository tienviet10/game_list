class RenameReviewToGameNoteInUserGames < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_games, :review, :game_note
  end
end
