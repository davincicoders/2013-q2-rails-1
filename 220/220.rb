require './connect_to_db.rb'

# TODO: create three rows in the cats table.
# The cats' names should be Fluffy, Furry, and Felix, in that order.
# Their starting location should all be "in a box."

Cat.destroy_all # start with this, so there are only three cats at most

puts "Enter name"
name = readline.chomp

if name ==""
	puts "please enter a name "
	name = readline.chomp
else
new_cat = Cat.create(name: "#{name}")
end
