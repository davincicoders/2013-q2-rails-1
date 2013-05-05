require './connect_to_db.rb'

puts "Enter your username:"
entered_username = readline.chomp
puts "Enter your password:"
entered_password = readline.chomp

# Secure but inefficient:
# user = nil
# for a_user in G218User.all
#   if a_user.username == entered_username
#     user = a_user
#   end
# end

# NOT SECURE: vulnerable to SQL injection
# user = G218User.where("username = '#{entered_username}'").first

# More secure:
user = G218User.where(username: entered_username).first

# More secure:
# user = G218User.where("username = ?", entered_username).first

if user.password == entered_password
  puts "Correct password"
else
  puts "Incorrect password"
end

#p Element.where("id = '5'); drop table elements; select (3")
