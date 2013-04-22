# Ask for a password, then print Correct if the password is dvc or DVC or Dvc or any other uppercase-lowercase possibility. Otherwise print Incorrect.
strPass = ""

puts "Enter the password:"

strPass = readline.chomp

if strPass.upcase == "DVC"
  puts "Correct"
else
  puts "Incorrect"
end
