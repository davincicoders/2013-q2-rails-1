require './connect_to_db'


puts "Enter username:"
entered_username = readline.chomp
puts "Enter password:"
entered_password = readline.chomp

# TODO: print out one of the following messages:
#   Correct password.
#   Incorrect password.
#   Unknown username.

user = G189User.where(username: entered_username).first

if user != nil
  if user.password == entered_password
    puts "Correct password."
  elsif
    puts "Incorrect password."
  end
else
  	puts "Unknown username."
end
