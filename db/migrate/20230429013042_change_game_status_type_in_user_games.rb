class ChangeGameStatusTypeInUserGames < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      ALTER TABLE user_games ALTER COLUMN game_status TYPE game_status USING game_status::game_status;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE user_games ALTER COLUMN game_status TYPE text USING game_status::text;
    SQL
  end
end
