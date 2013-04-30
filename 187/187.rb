require './connect_to_db'

puts "Property type (Public, Private, Parks and Rec, RTD, or leave blank):"
property_type = readline.chomp
puts "Power type (Wired Only, Solar Only, Solar w/Wire Back-up, or leave blank):"
power_type = readline.chomp
puts "Word to search for in station name, or leave blank:"
word = readline.chomp

# TODO: Implement printing out the station names that match the filters

prop = BCycleStation.where("property_type like ?", "%#{property_type}%")
pow = prop.where("power_type like ?", "%#{power_type}%")
stations = pow.where("station_name like ?", "%#{word}%")



for station in stations
puts station.station_name
end