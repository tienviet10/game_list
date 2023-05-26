class CreateUserGameNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_game_notes do |t|
      t.references :user_game, null: false, foreign_key: true
      t.text :game_note

      t.timestamps
    end
  end
end
