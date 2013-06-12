# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MenuItem.create(name: 'Hot Chocolate', price: 2.50)
MenuItem.create(name: 'Milk',          price: 2.00)
MenuItem.create(name: 'Bottle water',  price: 2.00)
MenuItem.create(name: 'Juice',         price: 2.50)
MenuItem.create(name: 'Canned pop',    price: 2.00)

RestaurantTable.create(id:  1, number_of_chairs: 2)
RestaurantTable.create(id:  2, number_of_chairs: 2)
RestaurantTable.create(id:  3, number_of_chairs: 2)
RestaurantTable.create(id:  4, number_of_chairs: 2)
RestaurantTable.create(id:  5, number_of_chairs: 2)
RestaurantTable.create(id:  6, number_of_chairs: 2)
RestaurantTable.create(id:  7, number_of_chairs: 2)
RestaurantTable.create(id:  8, number_of_chairs: 4)
RestaurantTable.create(id:  9, number_of_chairs: 2)
RestaurantTable.create(id: 10, number_of_chairs: 4)
RestaurantTable.create(id: 11, number_of_chairs: 2)
