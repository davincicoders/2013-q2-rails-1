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

# Strategy:
# - Ask for actor #1 and save their name.
puts "Enter the name of actor 1."

a1_full_name = readline.chomp
a1_first_name = a1_full_name.split(" ")[0]
a1_last_name = a1_full_name.split(" ")[1]

    # Check for no name or an incomplete name
    # added 02/16/13 - Dan D example
    # if error from (shell) command line type in echo $?
    # number assigned to exit will show in command line
    #reference code with 1 to see where error was made
    if a1_first_name == nil || a1_last_name == nil
        puts "You did not enter a full name for the first actor."
        puts "Please start over."
        exit 1
    end

# - Ask for actor #2 and save their name.
puts "Enter the name of actor 2."

a2_full_name = readline.chomp
a2_first_name = a2_full_name.split(" ")[0]
a2_last_name = a2_full_name.split(" ")[1]

    if a2_first_name == nil || a2_last_name == nil
        puts "You did not enter a full name for the second actor."
        puts "Please start over."
        exit 1
    end

# - Find actor #1's ID in the actors table
a1_find_id = Actor.where({ :first_name => a1_first_name,
                            :last_name => a1_last_name }).first

# - Find actor #2's ID in the actors table
a2_find_id = Actor.where({ :first_name => a2_first_name,
                            :last_name => a2_last_name }).first

a1_actor_id = a1_find_id.id
a2_actor_id = a2_find_id.id

    if a1_find_id  == nil && a2_find_id == nil
        puts "Neither #{a1_full_name} or #{a2_full_name} were found."
        puts "Please start over."
        exit 0
    elsif a1_find_id  == nil
        puts "The actor #{a1_full_name} was not found."
        puts "Please start over."
        exit 0
    elsif a2_find_id == nil
        puts "The actor #{a2_full_name} was not found."
        puts "Please start over."
        exit 0
    end

# - Find actor_movies rows that have actor #1's IDs, and save the movies' IDs.
a1_find_movie_id = ActorsMovie.where({ :actor_id => a1_actor_id })
a2_find_movie_id = ActorsMovie.where({ :actor_id => a2_actor_id })

    if a1_find_movie_id.first == nil
        puts "No movies exist for #{a1_full_name}."
        puts "Please try again."
        exit 0
    end

    if a2_find_movie_id.first == nil
        puts "No movies exist for #{a2_full_name}."
        puts "Please try again."
        exit 0
    end

    a1_movie_ids = []
    a2_movie_ids = []
    a1_find_movie_id.each{ |movie_id1| a1_movie_ids << movie_id1.movie_id}
    a2_find_movie_id.each{ |movie_id2| a2_movie_ids << movie_id2.movie_id}

puts "a1_movie_ids: #{a1_movie_ids}"
puts "a2_movie_ids: #{a2_movie_ids}"

#------------------------------------------------------------
# ref Dan D and Zeb array intersection
#
puts "Movies that #{a1_full_name} and #{a2_full_name} were both in: "
#
# Use the array intersection operator
# interesting way to search for common elements in an array...
# x = [0, 10, 15]
# y = [0, 20, 15]
# x & y # => [0, 15] 
#
common_movie_ids = a1_movie_ids & a2_movie_ids

    puts "  Sorry, no movies found" if common_movie_ids == []

common_movie_ids.each do |common_movie_id|
    movie_name = Movie.find(common_movie_id).title
    puts "  #{movie_name}"
end

# print out array intersection solution 
puts "      (Array Intersection)"

# - Loop through actor #1's movie IDs.
# -   If actor #2's movie IDs includes that movie ID,
# -      Look up the movie for that ID and print it.
#

# Use the .include? method
#
movie_found = false
a1_movie_ids.each do |movie_id1|
    if a2_movie_ids.include?(movie_id1)
        movie_found = true
        movie_name = Movie.find(movie_id1).title
        puts "  #{movie_name}"
    end  
end  

# print out include? solution
puts "  Sorry, no movies found" if movie_found == false
puts "      (.include?)"

#
# Use nested loops for old times sake
#
movie_found = false
a1_movie_ids.each do |movie_id1|
    a2_movie_ids.each do |movie_id2|
        if movie_id1 == movie_id2
            movie_found = true
            movie_name = Movie.find(movie_id1).title
            puts "  #{movie_name}"
        end  
    end  
end  

###########
#binding.pry
###########
# print out nested loops solution
puts "  Sorry, no movies found" if movie_found == false
puts "      (Nested Loops)"
