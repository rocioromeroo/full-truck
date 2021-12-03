class CreateTrucks < ActiveRecord::Migration[6.1]
  def change
    create_table :trucks do |t|
      t.string :capacity
      t.string :model
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
