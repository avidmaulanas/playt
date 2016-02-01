class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :privacy
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
