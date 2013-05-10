require './connect_to_db.rb'

# TODO: create three rows in the cats table.
# The cats' names should be Fluffy, Furry, and Felix, in that order.
# Their starting location should all be "in a box."

Cat.destroy_all # start with this, so there are only three cats at most

Cat.create(name: "Fluffy", location: "in a box")
Cat.create(name: "Furry", location: "in a box")
Cat.create(name: "Felix", location: "in a box")
