class AddYtIdToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :yt_id, :string
  end
end
