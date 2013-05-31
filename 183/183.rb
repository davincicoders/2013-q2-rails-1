require './connect_to_db'

puts "Enter the name of a state abbreviation (e.g. Colo.):"
state = readline.chomp
name = UsCity.where(name: "name, Colo.")
for city in cities
  puts city.name
end
