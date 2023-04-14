class CreateJoinTablePlatformGame < ActiveRecord::Migration[6.1]
  def change
    create_join_table :platforms, :games do |t|
      # t.index [:platform_id, :game_id]
      # t.index [:game_id, :platform_id]
    end
  end
end
