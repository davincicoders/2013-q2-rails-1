total = 0
while true 
  number = readline.chomp
  if number == ""
    break
  end
   number = number.to_i
   total = number + total
end
puts total