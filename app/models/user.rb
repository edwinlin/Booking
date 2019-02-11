class User < ApplicationRecord
  has_many :listings
  has_many :bookings, through: :listings
  has_secure_password
end
