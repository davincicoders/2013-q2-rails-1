require './connect_to_db.rb'

puts "Please enter the name of an actor (first and last name):"
full_name = readline.chomp
first_name = full_name.split(" ")[0]
last_name = full_name.split(" ")[1]

actor = Actor.where(first_name: first_name, last_name: last_name).first
if actor == nil
  puts "Sorry, the actor #{full_name} was not found."
else
  if actor.movies.size > 0
    for movie in actor.movies
      puts movie.title
    end
  else
    puts "Sorry, no movies recorded for this actor."
  end
end