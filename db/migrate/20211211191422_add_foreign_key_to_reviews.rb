class AddForeignKeyToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :freights
  end
end
