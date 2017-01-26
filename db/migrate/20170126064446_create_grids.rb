class CreateGrids < ActiveRecord::Migration[5.0]
  def change
    create_table :grids do |t|
      t.integer :x_max
      t.integer :y_max

      t.timestamps
    end
  end
end
