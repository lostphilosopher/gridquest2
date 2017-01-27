class CreateScenes < ActiveRecord::Migration[5.0]
  def change
    create_table :scenes do |t|
      t.string :name, null: false
      t.string :description
      t.integer :seed_min, null: false
      t.integer :seed_max, null: false
      t.timestamps
    end
  end
end
