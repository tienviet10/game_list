class AddNewColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :listsOrder, :string
  end
end
