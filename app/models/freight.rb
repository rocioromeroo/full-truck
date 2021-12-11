class Freight < ApplicationRecord
  belongs_to :truck
  has_many :reservations
  has_many :reviews
end
