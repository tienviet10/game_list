# Polymorphic association for likes

class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :likeable, polymorphic: true, null: false
      t.timestamps
    end

    add_index :likes, [:user_id, :likeable_type, :likeable_id], unique: true
    add_index :likes, [:likeable_type, :likeable_id]
  end
end
