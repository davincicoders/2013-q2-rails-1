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
        has_and_belongs_to_many :movies
end

class Award < ActiveRecord::Base
        belongs_to :movies
end

class Movie < ActiveRecord::Base
        has_many :awards
        has_and_belongs_to_many :actors
end

class ActorsMovie < ActiveRecord::Base
end

# Tell the user to enter a movie title to look up actors for
puts "Enter a movie name to see its actors:"

# Read from the keyboard into a variable
movie_name_input = readline()

# Remove the newline from that variable
movie_name_input = movie_name_input.chomp

# Find the Movie object with that title
find_movie_record = Movie.where({ :title => movie_name_input }).first

# Save its ID into a variable named movie_id.
find_movie_id = find_movie_record.id

# Find the ActorsMovies with the movie_id that matches the movie_id variable.
    find_actors = find_movie_record.actors

#binding.pry
    puts "#{movie_name_input} stars the following actor(s):"
    for find_actor in find_actors
        puts "#{find_actor.first_name} #{find_actor.last_name}"
    end


# For each ActorsMovie object you find,
#    Add its actor_id to a variable called actor_ids.
# For actor_id in actor_ids,
#    Find the actor name for that ID.
#    Print their name