class CreateSellCds < ActiveRecord::Migration[5.2]
  def change
    create_table :sell_cds do |t|
      t.integer :label_id,null: false
      t.integer :genre_id,null: false
      t.integer :artist_id,null: false
      t.string :title,null: false
      t.integer :value,null: false
      t.text :image_id
  	  t.integer :sell_status,null: false
  	  t.integer :stock,null: false
  	  t.datetime :deleted_at
      t.timestamps
    end
    add_index :sell_cds, :title
  end
end
