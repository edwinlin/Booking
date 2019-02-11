class Lister < ApplicationRecord
	has_many :listings
	has_many :bookings, through: :listings
	has_many :bookers, through: :bookings

	validates :name, presence:true

end
