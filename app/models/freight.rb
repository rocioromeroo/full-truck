class Freight < ApplicationRecord
  belongs_to :truck
  has_many :reservations
  has_many :reviews

  has_one_attached :cover_image
  has_many_attached :gallery_images
end
