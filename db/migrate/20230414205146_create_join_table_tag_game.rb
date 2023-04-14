class CreateJoinTableTagGame < ActiveRecord::Migration[6.1]
  def change
    create_join_table :tags, :games do |t|
      # t.index [:tag_id, :game_id]
      # t.index [:game_id, :tag_id]
    end
  end
end
