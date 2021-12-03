class AddDescriptionToFreights < ActiveRecord::Migration[6.1]
  def change
    add_column :freights, :description, :string
  end
end
