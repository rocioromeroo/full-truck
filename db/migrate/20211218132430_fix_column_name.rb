class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :reviews, :freights_id, :freight_id
  end
end
