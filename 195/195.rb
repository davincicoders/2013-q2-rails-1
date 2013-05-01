require './connect_to_db.rb'

puts "Enter a movie title to see its actors (limited to this tiny database):"
movie_title = readline.chomp

# TODO

movie = Movie.where(title: movie_title).first
if movie == nil
  puts "Sorry, #{movie_title} was not found."
else
  for actor in movie.actors
    puts "#{actor.first_name} #{actor.last_name}"
  end
end
