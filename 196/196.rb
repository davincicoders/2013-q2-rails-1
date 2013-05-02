require './connect_to_db.rb'
require 'pry'

puts "Please enter the name of an actor (first and last name):"
full_name = readline.chomp

strFirstName = full_name.split(" ").first
strLastName = full_name.split(" ").last

# TODO: List the movies that the entered actor was in.
# If the actor is not found, print:
# Sorry, the actor ___ was not found.

actor = Actor.where(first_name: strFirstName).where(last_name: strLastName).first

#binding.pry

if actor
  for movie in actor.movies
    puts movie.title
  end
else
  puts "Sorry, the actor #{full_name} was not found."
end
