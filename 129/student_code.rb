#Ask for a number, then print that number of stars. (i.e. if 
#the user enters 3, print ***).

puts "Enter a number:"
number = readline.to_i
star = "*"

while number > 1 
  star = "#{star}*"
  number = number -1
end

puts star
