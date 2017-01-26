class GridReference < ActiveRecord::Migration[5.0]
  def change
    add_reference :boxes, :grid, index: true
  end
end
