require './connect_to_db.rb'



puts "Please enter a username."
username = readline.chomp
while G218User.where(username: username) == []
  puts "Please enter a valid username."
  username = readline.chomp
end
puts "Please enter your password."
current_password = readline.chomp
while G218User.where(username: username).where(password: current_password) == []
  puts "The password you entered does not match your username."
  current_password = readline.chomp
end
puts "Please enter a new password."
new_password = readline.chomp
G218User.where(username: username).first.password = new_password
G218User.where(username: username).first.save

  



