class CreateNpcs < ActiveRecord::Migration[5.0]
  def change
    create_table :npcs do |t|
      t.string :name, null: false
      t.string :description
      t.integer :base_attack, null: false, default: 1
      t.integer :base_defense, null: false, default: 1
      t.integer :base_health, null: false, default: 1
      t.timestamps
    end
  end
end
