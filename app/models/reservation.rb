class Reservation < ApplicationRecord
  belongs_to :freight
  belongs_to :user
end
