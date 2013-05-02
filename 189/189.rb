require './connect_to_db'

puts "Enter username:"
entered_username = readline.chomp
puts "Enter password:"
entered_password = readline.chomp

objUser = G189User.where(username: entered_username).first

puts case 
    when entered_username != "Jen" && entered_username != "Jim"; "Unknown username."
    when objUser && objUser.password == entered_password; "Correct password."
    else "Incorrect password."
    end 


# TODO: print out one of the following messages:
#   Correct password.
#   Incorrect password.
#   Unknown username.
