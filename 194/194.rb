require './connect_to_db.rb'

puts "Enter a movie title to see its awards:"
movie_title = readline.chomp

# TODO: list the awards that this movie won, if any.
# If it didn't won any awards, print out:
# This movie didn't win any awards.
# If there's no movie by that title, print out:
# Sorry, ___ was not found.


movie = Movie.where(title: movie_title).first
if movie == nil
  puts "Sorry, #{movie_title} was not found."
else
	movie_size = movie.awards.size
  if movie_size > 0
    for award in movie.awards
      puts award.award_name
    end
  else
    puts "This movie didn't win any awards."
  end
end