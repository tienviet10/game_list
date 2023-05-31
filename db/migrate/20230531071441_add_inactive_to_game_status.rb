class AddInactiveToGameStatus < ActiveRecord::Migration[6.1]
  def up
    execute "ALTER TYPE game_status ADD VALUE 'Inactive'"
  end

  def down
    execute "ALTER TYPE game_status DROP VALUE 'Inactive'"
  end
end
