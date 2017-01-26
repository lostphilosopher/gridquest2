class AddThemeToElements < ActiveRecord::Migration[5.0]
  def change
    add_reference :npcs, :theme, index: true
    add_reference :items, :theme, index: true
  end
end
