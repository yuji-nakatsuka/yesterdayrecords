class CreateSellCdImages < ActiveRecord::Migration[5.2]
  def change
    create_table :sell_cd_images do |t|
      t.integer :sell_cd_id
      t.text :image_id
      t.timestamps
    end
  end
end
