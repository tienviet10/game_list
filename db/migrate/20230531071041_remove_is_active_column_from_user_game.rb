class RemoveIsActiveColumnFromUserGame < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_games, :is_active, :boolean
  end
end
