# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Starting seed file"

puts "Desroying previous info..."
Freight.destroy_all
User.destroy_all
Truck.destroy_all

puts "Seeding new Information"
puts "Creating a user, a truck and 5 Freights..."
User.create! :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
Truck.create!(capacity: "5.000 toneladas", model: "222", user_id: 1)
Freight.create!(date: Date.new(2022, 2, 2), departure: "Santa Fe", destination: "Buenos Aires", price: 149.00, departure_time: "5:00 P.M.", estimated_time_arrival: "01:00 A.M.", truck_id: 1, description: "DDD")
Freight.create(date: Date.new(2021, 12, 12), departure: "Santa Fe", destination: "Buenos Aires", price: 149.00, departure_time: "5:00 P.M.", estimated_time_arrival: "01:00 A.M.", truck_id: 1, description: "DDD")
Freight.create(date: Date.new(2022, 5, 5), departure: "Cancun", destination: "Ciudad de Mexico", price: 200.00, departure_time: "6:00 A.M.", estimated_time_arrival: "10:00 P.M.", truck_id: 1, description: "DDD")
Freight.create(date: Date.new(2022, 4, 4), departure: "Cancun", destination: "Ciudad de Mexico", price: 200.00, departure_time: "6:00 A.M.", estimated_time_arrival: "10:00 P.M.", truck_id: 1, description: "DDD")
Freight.create(date: Date.new(2022, 6, 6), departure: "Cancun", destination: "Ciudad de Mexico", price: 200.00, departure_time: "6:00 A.M.", estimated_time_arrival: "10:00 P.M.", truck_id: 1, description: "DDD")
puts "Done!"
