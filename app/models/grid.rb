class Grid < ApplicationRecord
  def find_by_coordinates(x_cord, y_cord)
    Box.find_by(
      grid_id: id,
      x: x_cord,
      y: y_cord
    )
  end
end
