class AddThemeToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_reference :players, :theme, index: true
  end
end
