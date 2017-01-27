class AddExplored < ActiveRecord::Migration[5.0]
  def change
    add_column :populations, :explored, :boolean, null: false, default: false
  end
end
