require './connect_to_db'
require "pry"

puts "Enter username:"
entered_username = readline.chomp
if entered_username == "Jill" || entered_username == "Jim"
  puts "Enter password" 
else puts "Unknown username." 

entered_password = readline.chomp
if entered_passwor


end
  
  entered_password = readline.chomp

#binding.pry

#TODO: print out the following messages:

#objUser = G189User.where(username: entered_username).first

#puts objUser.username
=begin
if objUser && objUser.password == entered_password
  puts "Correct password"
elsif objUser && objUser.password != entered_password
  puts "Incorrect password."
esle
  puts "Unknown username."
end

=begin
# Check for user-doesn't-exist
if entered_password != "Jen" && entered_password != "Jim"
  puts "Unknown username."

user = G189User.where(username: entered_username).first

if user != nil
  if user.password == entered_password
    puts "Correct password."
  else
	puts "Incorrect password"
  end
else
	puts "Unknown username."
end

#binding.pry
# TODO: print out one of the following messages:
#   Correct password.
#   Incorrect password.
#   Unknown username.
=end  
