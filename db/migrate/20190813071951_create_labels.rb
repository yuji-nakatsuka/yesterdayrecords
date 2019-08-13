class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|

      t.timestamps
      t.string :label
    end
  end
end
