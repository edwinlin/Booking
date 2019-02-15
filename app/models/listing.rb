class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :location, presence: true
end
