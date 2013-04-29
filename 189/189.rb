# Seth
=begin
require './connect_to_db'

puts "Enter username:"
entered_username = readline.chomp
query = G189User.where(username: "#{entered_username}").first
user = query.username

  if query == nil
    puts "Unknown username."
  else
      correct_password = query.password
    puts "Enter password:"
    entered_password = readline.chomp
    if entered_password == correct_password
      puts "Correct password."
    else
      puts "Incorrect password"
    end
  end
=end


require './connect_to_db'

puts "Enter username:"
entered_username = readline.chomp
puts "Enter password:"
entered_password = readline.chomp

query = G189User.where(username: "#{entered_username}").first

  if query == nil
    puts "Unknown username."
  elsif 
    user = query.username
    correct_password = query.password

    if entered_password == correct_password
      puts "Correct password."
    else
      puts "Incorrect password."
    end
  end