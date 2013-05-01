#
# Date: 2/18/2013
#
# Write a program to find all of the movies for the requested actor
#
# Same as homework from .../exercises/02-11-mon/3_oscars_again but
#   use validations and associations
#
# Output:
# ruby 4_actor_to_movies.dd.rb 
#   Please enter the name of an actor
#
#   Sorry, you did not enter a full name for the actor
#
# ruby 4_actor_to_movies.dd.rb 
#   Please enter the name of an actor
#   ""
#   Sorry, you did not enter a full name for the actor
#
# ruby 4_actor_to_movies.dd.rb 
#   Please enter the name of an actor
#   "" ""
#
#   Sorry, the actor "" "" was not found
#
# ruby 4_actor_to_movies.dd.rb 
#   Please enter the name of an actor
#   Rachel Ward
#
#   Sorry, the actor Rachel Ward was not found
#
# ruby 4_actor_to_movies.dd.rb 
#   Please enter the name of an actor
#   Brad Pitt
#
#   Movies that Brad Pitt was in:
#     Moneyball
#     The Tree of Life
#     Ocean's Eleven
#
# ruby 4_actor_to_movies.dd.rb 
#   Please enter the name of an actor
#   Viola Davis
#
#   Movies that Viola Davis was in:
#     The Help
#
# ruby 4_actor_to_movies.dd.rb 
#   Please enter the name of an actor
#   George Clooney
#
#   Movies that George Clooney was in:
#     The Descendants
#     Ocean's Eleven
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

# Ask for an actor
puts "Please enter the name of an actor"
full_name = readline.chomp
first_name = full_name.split(" ")[0]
last_name = full_name.split(" ")[1]

# Check for no name or an incomplete name
if first_name == nil || last_name == nil
    puts "Sorry, you did not enter a full name for the actor"
    exit 1
end

# Cause execution to go into the pry runtime developer console
#binding.pry

# Find their ID in the actors table
actor_object = Actor.where({ :first_name => first_name,
                             :last_name => last_name }).first
if actor_object.nil?
    puts "\nSorry, the actor #{full_name} was not found"
    exit 0
end

puts "\nMovies that #{full_name} was in:"

# Find the movies for this actor
movie_objects = actor_object.movies
movie_objects.each do |movie_object|
    movie_title = movie_object.title
    puts "  #{movie_title}"
end
