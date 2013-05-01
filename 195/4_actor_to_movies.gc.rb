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


# Ask for an actor
puts "Please enter the name of an actor"
full_name = readline.chomp
first_name = full_name.split(" ")[0]
last_name = full_name.split(" ")[1]

# Find their ID in the actors table
    find_actor_record = Actor.where({ :first_name => first_name, 
                                :last_name => last_name }).first

puts "#{full_name} stars in the following movie(s):"
# Find movie rows that have that same actor_id, and save the movies' IDs.
# For each of the saved movie IDs, look up its title in the movies table.
# And print those titles.
    for movie in find_actor_record.movies
        puts movie.title
    end

#binding.pry


