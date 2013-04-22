#Ask for a number, and print out a number one higher. 
#(i.e. if the user enters 3, print 4). (Hint: use 
#readline.chomp.to_i instead of readline.chomp.)

puts "Enter a number:"
user_input = readline.chomp.to_i
puts user_input + 1