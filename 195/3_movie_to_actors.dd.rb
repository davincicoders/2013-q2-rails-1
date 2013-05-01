#
# Date: 2/17/2013
#
# Write a program to find all of the actors for the requested movie
#
# Same as homework from .../exercises/02-11-mon/3_oscars_again but
#   use validations and associations
#
# Output:
# ruby 3_movie_to_actors.dd.rb 
#   Enter a movie name to see its actors:
#   <CR>
#   Sorry, you did not enter a movie name
#
# ruby 3_movie_to_actors.dd.rb 
#   Enter a movie name to see its actors:
#   ""
#
#   Actors for "":
#     Sorry, no actors exist for ""
#
# ruby 3_movie_to_actors.dd.rb 
#   Enter a movie name to see its actors:
#   '""'
#
#   Sorry, the movie '""' was not found
#
# ruby 3_movie_to_actors.dd.rb 
#   Enter a movie name to see its actors:
#   Hugo
#
#   Actors for Hugo:
#     Sorry, no actors exist for Hugo
#
# ruby 3_movie_to_actors.dd.rb 
#   Enter a movie name to see its actors:
#   The Tree of Life
#
#   Actors for The Tree of Life:
#     Brad Pitt
#     Sean Penn
#

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
#ActiveRecord::Base.logger = Logger.new(STDOUT)
#ActiveRecord::Base.logger.formatter = proc { |sev, time, prog, msg| "#{msg}\n" }

class Actor < ActiveRecord::Base
    validates_presence_of(:first_name)
    validates_presence_of(:last_name)
    validates_uniqueness_of(:first_name, { :scope => :last_name })

    has_many(:awards)
    has_and_belongs_to_many(:movies)
end

class Movie < ActiveRecord::Base
    validates_presence_of(:title)
    validates_uniqueness_of(:title, { :case_sensitive => false })

    ### I added H&BTM association and removed this one:
    ###   belongs_to(:actor)
    has_and_belongs_to_many(:actors)
end

class Award < ActiveRecord::Base
    validates_presence_of(:award_name)
    validates_presence_of(:movie_id)
    validates_presence_of(:year)
    validates_uniqueness_of(:award_name, { :scope => :year })

    has_and_belongs_to_many(:actors)
end

# Usage message for errors
usage = "Usage: ruby #{$0}"

# Check for improper number of arguments
if ARGV.length != 0
    puts usage
    exit 1
end

# Tell the user to enter a movie title to look up actors for
puts "Enter a movie name to see its actors:"

# Read from the keyboard into a variable
movie_name = readline().chomp

# Check for no movie entered
if movie_name == ""
    puts "Sorry, you did not enter a movie name"
    exit 1
end

# Cause execution to go into the pry runtime developer console
#binding.pry

### Find the Movie objects with that title
movie_objects = Movie.where({ :title => movie_name })
if movie_objects.first.nil?
    puts "\nSorry, the movie #{movie_name} was not found"
    exit 0
end

puts "\nActors for #{movie_name}:"

### Find and display the actors for this movie
###   The each loop is unnecessary since there is only one movie
movie_objects.each do |movie_object|

    # This catches the movie title of "" (which is in the movies table)
    if movie_object.actors.first.nil?
        puts "  Sorry, no actors exist for #{movie_name}"
    else

        ### This works also but causes a database lookup for each part of name
        ###   print "  #{movie_object.actors.first.first_name} "
        ###   puts  "#{movie_object.actors.first.last_name}"
        ### This requires only one database lookup
        movie_object.actors.each do |actor_object|
            puts "  #{actor_object.first_name} #{actor_object.last_name}"
        end
    end
end
