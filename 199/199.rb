require './connect_to_db.rb'

element_names = Element.order("name")
for item in element_names
puts item.name
end