total = 0
while true 
  num = readline.chomp
  if num == ""
    break
  end
  
   num = num.to_i
   total = num + total
end
puts total
