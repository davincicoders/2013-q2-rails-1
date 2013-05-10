require './connect_to_db.rb'

puts "Enter a first name to look up:"

first_name = readline.chomp

# TODO: look up the last name for the given first name
# and print something like: ___'s last name is ___.
# If you can't find an actor, print something like:
# Sorry, __ was not found.

actor = Actor.where(first_name: first_name).first

 
if actor == nil
  puts "Sorry, #{first_name} was not found."
else
  puts "#{first_name}'s last name is #{actor.last_name}."
end