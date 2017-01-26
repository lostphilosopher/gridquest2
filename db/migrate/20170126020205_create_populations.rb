class CreatePopulations < ActiveRecord::Migration[5.0]
  def change
    create_table :populations do |t|
      t.integer :health
      t.integer :seed
      t.timestamps
    end
  end
end
