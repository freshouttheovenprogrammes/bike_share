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

Item.create(title: "fixed gear bike", description: "Gotta get the fixed gear man!", price: 300.99, image: 'fixed_gear.png', quantity: 14, categories_id: 1)
Item.create(title: "rim", description: "Super cool rim for the cool kids.", price: 50.99, image: 'rim.png', quantity: 45, categories_id: 2)
Item.create(title: "tire", description: "Made of real rubber", price: 20.25, image: 'tire.png', quantity: 23, categories_id: 2)
