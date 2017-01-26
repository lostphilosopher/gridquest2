class CreateBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :boxes do |t|
      t.integer :x
      t.integer :y
      t.string :paths
      t.timestamps
    end
  end
end
