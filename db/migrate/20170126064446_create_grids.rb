class CreateGrids < ActiveRecord::Migration[5.0]
  def change
    create_table :grids do |t|
      t.integer :x_max, null: false, default: 10
      t.integer :y_max, null: false, default: 10

      t.timestamps
    end
  end
end
