require './connect_to_db'
require 'pry'

puts "Property type (Public, Private, Parks and Rec, RTD, or leave blank):"
property_type = readline.chomp
puts "Power type (Wired Only, Solar Only, Solar w/Wire Back-up, or leave blank):"
power_type = readline.chomp
puts "Word to search for in station name, or leave blank:"
word = readline.chomp

#binding.pry

# TODO: Implement printing out the station names that match the filters

dbase= BCycleStation.order

oldstation = ""
newstation = ""

if property_type != ""
  oldstation = dbase.where("property_type like ?", "%#{property_type}%")
end

if oldstation != ""
  if power_type != ""
    newstation = oldstation.where("power_type like ?", "%#{power_type}%")
    oldstation = newstation
  end
else
  oldstation = dbase.where("power_type like ?", "%#{power_type}%")
end

if oldstation != ""
  if word != ""
    newstation = oldstation.where("station_name like ?", "%#{word}%")
    oldstation = newstation
  end
else
  oldstation = dbase.where("station_name like ?", "%#{word}%")
end
for i in 0..(oldstation.size - 1)
  puts oldstation[i].station_name
end
#p oldstation
