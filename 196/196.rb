# John
require './connect_to_db.rb'

puts "Please enter the name of an actor (first and last name):"
full_name = readline.chomp

name = full_name.split(" ") # split the name.

first_name = name[0] # turn it into an array.

# define the var actor.
actor = Actor.where(first_name: first_name.capitalize).first

if actor == nil # are they in the list?
  puts "Sorry, #{full_name} was not found."
  
else
  actors_movies = actor.movies # define the list.
  for actors_movie in actors_movies
    puts "#{actors_movie.title}"
  end
end

# TODO: List the movies that the entered actor was in.
# If the actor is not found, print:
# Sorry, the actor ___ was not found.