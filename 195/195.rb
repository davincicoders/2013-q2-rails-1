require './connect_to_db.rb'

puts "Enter a movie title to see its actors (limited to this tiny database):"
movie_title = readline.chomp

movie = Movie.where(title: movie_title.titlecase).first

if movie == nil
  puts "Sorry, #{movie_title} was not found."

else
  movie_actors = movie.actors

  if movie_actors != []
    puts "#{movie_title} stars the following actor(s):"

    for movie_actor in movie_actors
      puts "#{movie_actor.first_name} #{movie_actor.last_name}"
    end
  end
end




# TODO: List the actors that acted in the movie that the user entered.
# If that movie isn't in the database, print:
# Sorry, ___ was not found.
# If there are no actors for that movie, just print nothing.
# Otherwise, print out the first and last name of each actor.
