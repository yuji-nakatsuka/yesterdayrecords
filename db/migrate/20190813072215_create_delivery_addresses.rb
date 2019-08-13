class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.integer :end_user_id,null: false
      t.string :zip,null: false
      t.text :delivery_address,null: false
      t.timestamps
    end
  end
end
