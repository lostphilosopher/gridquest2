class Game < ApplicationRecord
  has_one :user
  has_one :player
  has_one :theme
  has_many :populations

	def current_box
		Box.find_by(id: current_box_id)
	end

	def move(direction)
    x = self.current_box.x
		y = self.current_box.y
		case direction
    when 'n'
      y = y + 1
    when 's'
      y = y - 1
    when 'e'
      x = x + 1
    when 'w'
      x = x - 1
    else
    end

		unless Box.where(x: x, y: y).empty?
			update(current_box_id: Box.where(x: x, y: y).first.id)
		end
	end
end
