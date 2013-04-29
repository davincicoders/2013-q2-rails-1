require './connect_to_db'

puts "Enter username:"
entered_username = readline.chomp
puts "Enter password:"
entered_password = readline.chomp

user = G189User.where(username: "#{entered_username}").first
  if user == nil
    puts "Unknown username."
  elsif entered_username == user.username && entered_password == user.password
      puts "Correct password."
  else
     puts "Incorrect password."
  end