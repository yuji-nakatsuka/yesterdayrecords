class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|

      t.timestamps
      t.string :genre,null: false
    end
    add index :genres, :genre,unique:true
  end
end
