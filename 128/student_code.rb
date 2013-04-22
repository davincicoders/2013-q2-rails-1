#Ask for a password, then print Correct if 
#the password is dvc or DVC or Dvc or any 
#other uppercase-lowercase possibility. 
#Otherwise print Incorrect.

puts "Enter the password:"
user_input = readline.chomp.downcase
password = "dvc"


if user_input == password
  puts "Correct"
else
  puts "Incorrect"
end