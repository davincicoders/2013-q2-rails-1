require "active_record"
require "pry"
require "logger"

params = {
    :host     => "localhost",
    :adapter  => "postgresql",
    :username => "postgres",
    :password => "postgres",
    :database => "postgres",
    :encoding => "unicode",
}

ActiveRecord::Base.establish_connection(params)
ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger.formatter = proc { |sev, time, prog, msg| "#{msg}\n" }

class Actor < ActiveRecord::Base
end

class Award < ActiveRecord::Base
end

class Movie < ActiveRecord::Base
end

class ActorsMovie < ActiveRecord::Base
end

# Tell the user to enter a movie title to look up actors for
puts "Enter a movie name to see its actors:"

# Read from the keyboard into a variable
movie_name = readline()

# Remove the newline from that variable
movie_name = movie_name.chomp

# added 02/16/13 - Dan D example
# if error from (shell) command line type in echo $?
# number assigned to exit will show in command line
#reference code with 1 to see where error was made
if movie_name == ""
    puts "You did not enter a movie name. Please try again."
    exit 0
end

# Find the Movie object with that title
match_input = Movie.where({ :title => movie_name })

if match_input.first == nil
    puts "The movie #{movie_name} was not found. Please try again."
    exit 1
end

    movie_id = 0

    for get_id in match_input
        if movie_name == get_id.title 
            # Save its ID into a variable named movie_id.
            movie_id += get_id.id
        end
    end  

# Find the ActorsMovies with the movie_id that matches the movie_id variable.
match_movie_ids = ActorsMovie.where({ :movie_id => movie_id })
if match_movie_ids.first == nil
    puts "No actors found for #{movie_name}"
    exit 1
end

# For each ActorsMovie object you find,
#    Add its actor_id to a variable called actor_ids.
    
    actor_ids = []

    for actor in match_movie_ids
        if movie_id == actor.movie_id
            puts actor_ids << actor.actor_id
        end
    end  

puts "Actors for #{movie_name}:"  

#################
#binding.pry
#################
# ref Dan D

for actor_id in actor_ids
    if Actor.where({ :id => actor_id }).first == nil
        puts "  Actor ID of #{actor_id} is not in the Actors table"
        exit 0
    end

    first_name = Actor.where({ :id => actor_id }).first.first_name
    last_name  = Actor.where({ :id => actor_id }).first.last_name

    puts "#{first_name} #{last_name}"
end
