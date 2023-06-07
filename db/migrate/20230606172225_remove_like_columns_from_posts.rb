class RemoveLikeColumnsFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :like_type, :string
    remove_column :posts, :like_id, :integer
  end
end
