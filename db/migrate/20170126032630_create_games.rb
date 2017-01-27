class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :player_health, null: false, default: 1

      t.timestamps
    end
  end
end
