class PopulationReferences < ActiveRecord::Migration[5.0]
  def change
    add_reference :populations, :box, index: true
    add_reference :populations, :npc, index: true
    add_reference :populations, :item, index: true
  end
end
