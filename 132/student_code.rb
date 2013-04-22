n = 0
text = readline.chomp
if text != ""
  while text != ""
  n = (n + text.to_i) # Convert text to int and add to running total.
  text = readline.chomp
  end
else
end
puts n