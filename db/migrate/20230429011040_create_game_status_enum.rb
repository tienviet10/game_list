class CreateGameStatusEnum < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE game_status AS ENUM ('Playing', 'Completed', 'Paused', 'Planning', 'Dropped');
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE game_status;
    SQL
  end
end
