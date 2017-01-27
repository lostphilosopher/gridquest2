class Population < ApplicationRecord
  has_one :box
  has_one :item
  has_one :npc
  has_one :scene
  belongs_to :game

  def display_character(show_player = true)
    if (game.current_box.id == box_id) && show_player
      update(explored: true)
      '@'
    elsif !explored?
      '?'
    elsif npc
      'N'
    elsif item
      'I'
    else
      'X'
    end
  end
end
