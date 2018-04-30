require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(title: "bikes")
Category.create(title: "accessories")
Category.create(title: "tools")
Category.create(title: "lessons")

Item.create(title: "fixed gear bike", description: "Gotta get the fixed gear man!", price: 300.99, image: 'fixed_gear.png', quantity: 14, category_id: 1)
Item.create(title: "rim", description: "Super cool rim for the cool kids.", price: 50.99, image: 'rim.png', quantity: 45, category_id: 2)
Item.create(title: "tire", description: "Made of real rubber", price: 20.25, image: 'tire.png', quantity: 23, category_id: 2)
Item.create(title: "allen set", description: "For all those times you need the keys", price: 10.99, image: 'allen_set.png', quantity: 13, category_id: 3)
Item.create(title: "bike keys", description: "Fits all size bikes", price: 3.25, image: 'bike_keys.png', quantity: 10, category_id: 3)
Item.create(title: "spacer", description: "To measure and space tires", price: 12.25, image: 'spacer.png', quantity: 23, category_id: 3)
Item.create(title: "mountain bike", description: "Ready for the toughest hills", price: 435, image: 'mountain_bike.png', quantity: 10, category_id: 1)
Item.create(title: "beach cruiser", description: "Ready for the nearest beach", price: 564, image: 'cruiser.png', quantity: 23, category_id: 1)


station = CSV.open('db/csv/station.csv', headers: true, header_converters: :symbol)
station.each do |row|
  date_split = row[:installation_date].split("/")
    Station.create(id: row[:id],
                   name: row[:name],
                   latitude: row[:latitude].to_f,
                   longitude: row[:longitude].to_f,
                   dock_count: row[:dock_count].to_i,
                   city: row[:city],
                   installation_date: DateTime.new(date_split[2].to_i, date_split[0].to_i, date_split[1].to_i))
  end

  trips = CSV.open('db/csv/trip.csv', headers: true, header_converters: :symbol)
  trips.each do |row|
    start_date_split = row[:start_date].split[0].split("/")
    end_date_split = row[:end_date].split[0].split("/")
    Trip.create(duration: row[:duration].to_i,
                start_date: DateTime.new(start_date_split[2].to_i, start_date_split[0].to_i, start_date_split[1].to_i),
                start_station_id: row[:start_station_id].to_i,
                end_date: DateTime.new(end_date_split[2].to_i, end_date_split[0].to_i, end_date_split[1].to_i),
                end_station_id: row[:end_station_id].to_i,
                bike_id: row[:bike_id].to_i,
                subscription: row[:subscription_type],
                zipcode: row[:zip_code].to_i)
  end
