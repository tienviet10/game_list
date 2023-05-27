class CreateGameJournals < ActiveRecord::Migration[6.1]
  def change
    create_table :game_journals do |t|
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.timestamps
    end
  end
end
