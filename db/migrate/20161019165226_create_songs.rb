class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :song_title
      t.integer :artist_id

      t.timestamps null: false
    end
  end
end
