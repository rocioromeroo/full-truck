# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Starting seed file"

puts "Desroying previous info..."
Reservation.destroy_all
Freight.destroy_all
Review.destroy_all
Truck.destroy_all
User.destroy_all

puts "Seeding new Information"
puts "Creating a user, a truck and 5 Freights and a review..."
user = User.new(email: 'john@gmail.com', password: 'topsecret', password_confirmation:'topsecret')
user.save!
truck1 = Truck.new(
  capacity: "10.000 toneladas",
  model: "International",
  user: user
)
truck1.save!

truck2 = Truck.new(
  capacity: "15.000 toneladas",
  model: "Freightliner",
  user: user
)
truck2.save!

truck3 = Truck.new(
  capacity: "5.000 toneladas",
  model: "Volvo",
  user: user
)
truck3.save!

Freight.create!(
  date: Date.new(2022, 2, 2),
  departure: "Santa Fe",
  destination: "Buenos Aires",
  price: 100.00, departure_time: "5:00 P.M.",
  estimated_time_arrival: "Next day at 01:00 A.M.",
  truck: truck1,
  description: "Full truck. Returning from Santa Fe to Buenos Aires.new
  Available space for transporting any goods. We are the Expert on
   Freight Forwarding."
  )
Freight.create!(
  date: Date.new(2022, 1, 30),
  departure: "Ciudad de Cordoba",
  destination: "La Plata",
  price: 149.00, departure_time: "5:00 P.M.",
  estimated_time_arrival: "Next day at 01:00 A.M.",
  truck: truck2,
  description: "Half truck available space up to 5TN.
  Number one service provider. Rated 5 stars. Authorized to
   transporting Hazardous Materials."
  )
Freight.create!(
  date: Date.new(2022, 1, 25),
  departure: "Las Heras",
  destination: "Rosario",
  price: 120.00, departure_time: "11:00 P.M.",
  estimated_time_arrival: "05:00 A.M.",
  truck: truck3,
  description: "10 TN only. Returning from Las Heras.
   Availability to transfer any type of goods. (Hazardous
   Materials not allow) We are the Expert on Freight Forwarding."
  )
Freight.create!(
  date: Date.new(2022, 2, 1),
  departure: "Tucuman",
  destination: "Cordoba",
  price: 50.00, departure_time: "08:00 P.M.",
  estimated_time_arrival: "03:00 A.M.",
  truck: truck1,
  description: "Sale. Remaining 5 TN of space.
   Unique opportunity to ship your goods at very low price.
    We are the Expert on Freight Forwarding."
  )
Freight.create!(
  date: Date.new(2022, 2, 1),
  departure: "Salta",
  destination: "Tucuman",
  price: 99.99, departure_time: "1:00 P.M.",
  estimated_time_arrival: "02:00 A.M.",
  truck: truck2,
  description: "Full truck. Returning from Salta to Tucuman.
   Available space for transporting any goods. We are the Expert on
   Freight Forwarding."
  )
Freight.create!(
  date: Date.new(2022, 1, 31),
  departure: "La Rioja",
  destination: "Santa Fe",
  price: 100.00, departure_time: "5:00 P.M.",
  estimated_time_arrival: "01:00 A.M.",
  truck: truck3,
  description: "15 TN only. Returning from La Rioja.
   Availability to transfer any type of goods. (Hazardous
   Materials not allow) We are the Expert on Freight Forwarding."
  )

puts "Done!"
