class Population < ApplicationRecord
  has_one :box
  has_one :item
  has_one :npc
  belongs_to :game
end
