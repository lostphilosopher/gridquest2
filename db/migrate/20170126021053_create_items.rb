class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description
      t.integer :attack_buff, null: false, default: 0
      t.integer :defense_buff, null: false, default: 0
      t.integer :health_buff, null: false, default: 0
      t.timestamps
    end
  end
end
