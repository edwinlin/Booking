require 'faker'

50.times do User.create(name: Faker::Name.unique.name, email: Faker::Internet.email, password: Faker::Alphanumeric.alpha) end
User.create(name: "Cassidy Samelian", email: "cass@cass.com", password: "1")

50.times do Listing.create(location: Faker::Address.full_address, user_id: Faker::Number.between(1, 50)) end

70.times do Booking.create(user_id: Faker::Number.between(1, 50), start_date: Faker::Date.forward(60), end_date: Faker::Date.forward(70), listing_id: Faker::Number.between(1, 100)) end
