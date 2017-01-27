class Box < ApplicationRecord
  belongs_to :grid

  def self.paths_from_grid_boundaries(w, l)
    x = w
    y = l
    paths = ''
    paths << 'n' if y < 10
    paths << 's' if y > 1
    paths << 'e' if x < 10
    paths << 'w' if x > 1

    paths
  end

end
