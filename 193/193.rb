require './connect_to_db.rb'

puts "Enter a first name to look up:"
first_name = readline.capitalize.chomp

# define name in actor db where first names match.
name = Actor.where(first_name: first_name).first

if name == nil # if there is no match and name is empty.
  puts "Sorry, #{first_name} was not found."
else
  first = name.first_name # go ahead and define first name var.
  last = name.last_name # same with last name var.
  puts "#{first}'s last name is #{last}."
end

# TODO: look up the last name for the given first name
# and print something like: ___'s last name is ___.
# If you can't find an actor, print something like:
# Sorry, __ was not found.
