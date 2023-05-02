class AddBannerUrlToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :bannerURL, :string
  end
end
