# Request a password from the user.  If the password is correct, print "Correct", otherwise print "Incorrect".

puts "Enter the password:"
password = readline.chomp

if password == "dvc"
puts "Correct"
else
  puts "Incorrect"
end

