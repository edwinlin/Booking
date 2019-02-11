class Listing < ApplicationRecord
	belongs_to :lister
	has_many :bookings
	has_many :bookers, through: :bookings

	validates :name, presence:true

end
