class SceneReference < ActiveRecord::Migration[5.0]
  def change
    add_reference :populations, :scene, index: true
    add_reference :scenes, :theme, index: true
  end
end
