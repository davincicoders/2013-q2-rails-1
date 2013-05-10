require './connect_to_db.rb'

# TODO: create three rows in the cats table.
# The cats' names should be Fluffy, Furry, and Felix, in that order.
# Their starting location should all be "in a box."

Cat.destroy_all # start with this, so there are only three cats at most

Fluffy = Cat.new
Fluffy.name = "Fluffy"
Fluffy.location = "in a box"
Fluffy.save
Furry = Cat.new
Furry.name = "Furry"
Furry.location = "in a box"
Furry.save
Felix = Cat.new
Felix.name = "Felix"
Felix.location = "in a box"
Felix.save