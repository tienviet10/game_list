class CreateUserGames < ActiveRecord::Migration[6.1]
  def change
    create_table :user_games do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.string :game_status
      t.text :game_note
      t.timestamp :start_date
      t.timestamp :completed_date
      t.boolean :private
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end
