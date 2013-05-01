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

# Ask for an actor
puts "Please enter the name of an actor"
full_name = readline.chomp
first_name = full_name.split(" ")[0]
last_name = full_name.split(" ")[1]

# Check for no name or an incomplete name
# added 02/16/13 - Dan D example
# if error from (shell) command line type in echo $?
# number assigned to exit will show in command line
#reference code with 1 to see where error was made
    if first_name == nil || last_name == nil
        puts "Sorry, you did not enter a full name for the actor."
        puts "Please try again."
        exit 0
    end

# Find their ID in the actors table
find_id = Actor.where({ :first_name => first_name,
                        :last_name => last_name })
    if find_id.first == nil
        puts "The actor you entered, #{full_name}, was not found."
        puts "Please try again."
        exit 1
    end

actor_id = find_id.first.id

# Find movie rows that have that same actor_id, and save the movies' IDs.
find_movie_id = ActorsMovie.where({ :actor_id => actor_id })
    
    #cannot test this with current db
    if find_movie_id.first == nil
        puts "No movies have been found for #{full_name}."
        puts "Please start over."
        exit 1 
    end

# For each of the saved movie IDs, look up its title in the movies table.
    movie_ids = []
    
    for located_movie_id in find_movie_id
        if actor_id == located_movie_id.actor_id
            movie_ids << located_movie_id.movie_id
            # puts movie_ids
        end
    end

############
#binding.pry
############

puts "Movies that #{full_name} was in are: "

# For each of the saved movie IDs, look up its title in the movies table.
movie_title = Movie.where({ :id => movie_ids })

    movie_titles = []

    for lookup_title in movie_title
        if movie_ids != []
            movie_titles << lookup_title.title
        end
    end

    puts movie_titles
