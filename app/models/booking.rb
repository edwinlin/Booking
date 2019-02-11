class Booking < ApplicationRecord
	belongs_to :booker
	belongs_to :listing
	
	validates :name, presence:true
end
