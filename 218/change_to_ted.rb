require './connect_to_db.rb'

G218User.destroy_all
G218User.create(username: "Ted", password: "Ted")