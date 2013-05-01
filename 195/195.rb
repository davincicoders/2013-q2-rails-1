require './connect_to_db.rb'

puts "Enter a movie title to see its actors (limited to this tiny database):"
movie_title = readline.chomp

# TODO: List the actors that acted in the movie that the user entered.
# If that movie isn't in the database, print:
# Sorry, ___ was not found.
# If there are no actors for that movie, just print nothing.
# Otherwise, print out the first and last name of each actor.
