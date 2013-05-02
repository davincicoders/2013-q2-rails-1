require './connect_to_db.rb'

puts "Please enter the name of an actor (first and last name):"
full_name = readline.chomp

# TODO: List the movies that the entered actor was in.
# If the actor is not found, print:
# Sorry, the actor ___ was not found.

name_array = full_name.split(" ")                       # takes the string called "full_name", splits it into an array, and names it a variable called "name_array"
firstname = name_array[0]                               # takes the first item from the array called "name_array", and calls it "firstname".


actor = Actor.where(first_name: firstname).first        # searches the "Actor" table in the column called "first_name" for the "firstname" and returns the first object and names it a variable called "actor"

if actor == nil                                         # if the value returned is nil.... 
  puts "Sorry, the actor #{full_name} was not found."   # says "sorry I cant find it. 
else                                                    # Otherwise...
  movies = actor.movies                                 # lookup the actor in the movies table and return the movies in an array called "movies" 
  for movie in movies                                   # for each movie in the movies array      
    puts movie.title                                    # return the title of the movie
  end
end


