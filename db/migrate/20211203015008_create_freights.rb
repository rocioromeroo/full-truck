class CreateFreights < ActiveRecord::Migration[6.1]
  def change
    create_table :freights do |t|
      t.date :date
      t.string :departure
      t.string :destination
      t.decimal :price
      t.time :departure_time
      t.string :estimated_time_arrival
      t.references :truck, null: false, foreign_key: true

      t.timestamps
    end
  end
end
