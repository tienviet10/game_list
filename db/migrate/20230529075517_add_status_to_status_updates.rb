class AddStatusToStatusUpdates < ActiveRecord::Migration[6.1]
  def change
    add_column :status_updates, :status, :game_status
  end
end
