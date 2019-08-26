class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id,null: false
      t.integer :total_price,null: false
      t.integer :payment_method,null: false
      t.string :zip,null: false
      t.text :delivery_address,null: false
      t.integer :delivery_status,null: false
      t.timestamps
    end
  end
end
