class CreateStatusUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :status_updates do |t|
      t.references :user_game, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
