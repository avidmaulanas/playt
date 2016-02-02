class AddPlaylistToVideos < ActiveRecord::Migration
  def change
    add_reference :videos, :playlist, index: true, foreign_key: true
  end
end
