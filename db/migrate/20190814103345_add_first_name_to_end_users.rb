class AddFirstNameToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :first_name, :string,      null: false, default: ""
    add_column :end_users, :last_name, :string,      null: false, default: ""
    add_column :end_users, :kana_last, :string,      null: false, default: ""
    add_column :end_users, :kana_first, :string,     null: false, default: ""
    add_column :end_users, :zip, :string,            null: false, default: ""
    add_column :end_users, :address, :text,         null: false, default: ""
    add_column :end_users, :phone_number, :string,   null: false, default: ""
    add_column :end_users, :deleted_at, :string,   null: false, default: ""
  end
end
