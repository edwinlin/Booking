# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booker.create(name: "Edwin Lin")
Booker.create(name: "Cassidy Samelian")
Booker.create(name: "Jon Freed")
Booker.create(name: "John Sy")
Booker.create(name: "Bradley Cooper")

Lister.create(name: "Lister1")
Lister.create(name: "Lister2")
Lister.create(name: "Lister3")
Lister.create(name: "Lister4")
Lister.create(name: "Lister5")

Listing.create(name: "Soho 1", lister_id: 1)
Listing.create(name: "Soho 2", lister_id: 1)
Listing.create(name: "Soho 3", lister_id: 1)
Listing.create(name: "Soho 4", lister_id: 2)
Listing.create(name: "Tribeca 1", lister_id: 3)
Listing.create(name: "Tribeca 2", lister_id: 4)
Listing.create(name: "Tribeca 3", lister_id: 5)
Listing.create(name: "Tribeca 4", lister_id: 2)
Listing.create(name: "LIC 1", lister_id: 5)
Listing.create(name: "LIC 2", lister_id: 4)
Listing.create(name: "LIC 3", lister_id: 3)
Listing.create(name: "LIC 4", lister_id: 2)

Booking.create(name: "EdwinLIC1", booker_id: 1, listing_id: 9)
Booking.create(name: "CassTrib1", booker_id: 2, listing_id: 5)
Booking.create(name: "JonFSoho1", booker_id: 3, listing_id: 1)
Booking.create(name: "EdwinTrib2", booker_id: 1, listing_id: 6)
Booking.create(name: "SySoho4", booker_id: 4, listing_id: 4)
Booking.create(name: "BradLIC3", booker_id: 5, listing_id: 11)

