require './connect_to_db'
require "pry"

puts "Enter username:"
entered_username = readline.chomp
puts "Enter password:"
entered_password = readline.chomp

binding.pry

objUser = G189User.where(username: entered_username).first

puts case 
    when objUser && objUser.password == entered_password; "Correct password."
    else "Incorrect password."
    end 


# TODO: print out one of the following messages:
#   Correct password.
#   Incorrect password.
#   Unknown username.
