class Booker < ApplicationRecord
	has_many :bookings
	has_many :listings, through: :bookings
	has_many :listers, through: :listings

	validates :name, presence:true
end
