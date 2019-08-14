class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|

      t.timestamps
      t.string :label,null: false
    end
    add index :labels, :label,unique:true
  end
end
