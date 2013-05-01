=begin
Ask the user for an actor's first name, 
find which actor they're referring to, 
and print the actor's last name. (Assume 
there's only one actor for any first name).
=end

require './connect_to_db.rb'

puts "Enter a first name to look up:"
first_name = readline.chomp

actor = Actor.where(first_name: first_name).first

if actor == nil
puts "Sorry, #{first_name} was not found."
else  
puts "#{actor.first_name}'s last name is #{actor.last_name}."
end


# TODO: look up the last name for the given first name
# and print something like: ___'s last name is ___.
# If you can't find an actor, print something like:
# Sorry, __ was not found.
