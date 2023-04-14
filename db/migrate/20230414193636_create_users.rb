class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :banner_picture
      t.string :user_picture
      t.string :bio
      t.boolean :is_active

      t.timestamps
    end
  end
end
