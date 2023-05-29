class RemoveStatusInStatusUpdate < ActiveRecord::Migration[6.1]
  def change
    remove_column :status_updates, :status_id, :bigint
  end
end
