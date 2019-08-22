class CreateCdArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :cd_artists do |t|

      t.timestamps
      t.integer :artist_id, null: false
      t.integer :sell_cd_id,null: false
    end
  end
end
