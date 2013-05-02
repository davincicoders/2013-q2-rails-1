require './connect_to_db'

puts "Property type (Public, Private, Parks and Rec, RTD, or leave blank):"
property_type = readline.chomp
puts "Power type (Wired Only, Solar Only, Solar w/Wire Back-up, or leave blank):"
power_type = readline.chomp
puts "Word to search for in station name, or leave blank:"
word = readline.chomp

stations = BCycleStation.order('id')
if property_type != ""
  stations = stations.where(property_type: property_type)
end
if power_type != ""
  stations = stations.where(power_type: power_type)
end
if word != ""
  stations = stations.where("station_name like ?", "%#{word}%")
end

for station in stations
  puts station.station_name
end