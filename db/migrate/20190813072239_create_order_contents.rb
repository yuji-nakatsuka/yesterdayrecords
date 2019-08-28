class CreateOrderContents < ActiveRecord::Migration[5.2]
  def change
    create_table :order_contents do |t|
      t.integer :order_id,null: false
      t.integer :sell_cd_id,null: false
      t.integer :quantity,null: false
      t.timestamps
    end
  end
end
