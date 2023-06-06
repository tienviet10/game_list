class RemoveNullConstraintFromLikeInPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :like_id, true
    change_column_null :posts, :like_type, true
  end
end
