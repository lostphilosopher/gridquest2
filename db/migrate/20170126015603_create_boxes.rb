class CreateBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :boxes do |t|
      t.integer :x, null: false
      t.integer :y, null: false
      t.string :paths
      t.timestamps
    end
  end
end
