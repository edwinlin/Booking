class User < ApplicationRecord
  has_many :listings
  has_many :bookings, through: :listings
  has_many :bookings
  has_secure_password

  validates :name, :email, :password_digest, presence: true
  validates :email, uniqueness: true
end
