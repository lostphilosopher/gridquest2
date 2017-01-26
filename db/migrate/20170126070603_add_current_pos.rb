class AddCurrentPos < ActiveRecord::Migration[5.0]
  def change
		add_column :games, :current_box_id, :integer
	end
end
