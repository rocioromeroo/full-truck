class Truck < ApplicationRecord
  belongs_to :user
  def label_text
    "#{model} (#{capacity})"
  end
end
