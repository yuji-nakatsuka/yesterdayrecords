class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :artist,null: false
      t.timestamps
    end
    add_index :artists, :artist,unique:true
  end
end
