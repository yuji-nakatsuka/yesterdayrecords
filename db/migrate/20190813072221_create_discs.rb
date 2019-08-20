class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.integer :sell_cd_id,null: false
      t.integer :number,null: false
      t.string :disc,null: false
      t.timestamps
    end
  end
end
