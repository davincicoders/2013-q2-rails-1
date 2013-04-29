require './connect_to_db'

puts "Enter the name of a state abbreviation (e.g. Colo.):"
state = readline.chomp
cities = UsCity.where("name like ?", "%#{state}%")
for city in cities
  puts city.name
end
