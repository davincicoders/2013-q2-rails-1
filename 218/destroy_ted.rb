require './connect_to_db.rb'

user = G218User.where(username: "Ted").first

user.destroy