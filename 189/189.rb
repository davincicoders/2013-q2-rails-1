require './connect_to_db'

puts "Enter username:"
entered_username = readline.chomp
puts "Enter password:"
entered_password = readline.chomp

# TODO: print out one of the following messages:
objUser = G189User.where(username: entered_username).first

#puts objUser.username

if objUser && objUser.password == entered_password
  puts "Correct password."
elsif objUser && objUser.password != entered_password
  puts "Incorrect password."
else
  puts "Unknown username."
end
