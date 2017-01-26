class AddRanges < ActiveRecord::Migration[5.0]
  def change
    add_column :npcs, :seed_min, :integer, null: false
    add_column :npcs, :seed_max, :integer, null: false
    add_column :items, :seed_min, :integer, null: false
    add_column :items, :seed_max, :integer, null: false
  end
end
