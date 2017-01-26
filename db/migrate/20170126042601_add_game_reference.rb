class AddGameReference < ActiveRecord::Migration[5.0]
  def change
    add_reference :populations, :game, index: true
  end
end
