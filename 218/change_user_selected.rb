require './connect_to_db.rb'

puts "Enter username"
user = G218User.where(username: readline.chomp).first
puts "Enter password"
user.password = readline.chomp

user.save