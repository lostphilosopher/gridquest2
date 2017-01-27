class AddGameReference < ActiveRecord::Migration[5.0]
  def change
    add_reference :populations, :game, index: true
    add_reference :games, :user, index: true
    add_reference :games, :player, index: true
    add_reference :games, :theme, index: true
  end
end
