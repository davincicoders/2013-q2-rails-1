=begin
Ask the user for a movie title, then print out the names of the awards 
that this movie won (e.g. Best Picture, Best Actress).
=end

require './connect_to_db.rb'

puts "Enter a movie title to see its awards:"
movie_title = readline.chomp

movie = Movie.where(title: movie_title).first         # Search the "movies" table in the "title" column for the user entered movie title.  Return the first object and call it "movie"
if movie == nil                                       # If the search of the table returns "nil"...  
  puts "Sorry, #{movie_title} was not found."         # Puts "Sorry.."
else                                                  # Otherwise...
  awards = movie.awards                               # Lookup the movie in the awards table and return the objects in an array variable called "Awards"
  if awards.size == 0                                 # if the size of the "awards" array is 0, this means the movie sucked and didn't win any awards...
    puts "This movie didn't win any awards."          # and therefore put "This movie didn't..."
  else                                                # Otherwise...
    for award in awards                               # For every item in the "awards" array....
      puts award.award_name                           # Print out the "award name" from the "Awards Table" that is associated w/ the item
    end
  end
end
  


# TODO: list the awards that this movie won, if any.
# If it didn't won any awards, print out:
# This movie didn't win any awards.
# If there's no movie by that title, print out:
# Sorry, ___ was not found.
