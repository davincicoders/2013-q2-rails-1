require './connect_to_db.rb'

puts "Please enter the name of an actor (first and last name):"
full_name = readline.chomp

# TODO: List the movies that the entered actor was in.
# If the actor is not found, print:
# Sorry, the actor ___ was not found.

full_name = full_name.split(" ")
movie = Movie.where(actors: last_name).first

if movie == nil
  puts "Sorry, #{full_name} was not found."
else
  for actor in movie.actors

  end
end