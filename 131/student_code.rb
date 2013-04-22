# Wait for a line of user input, then print it back. (Do not have a puts line asking for the user to enter text). Repeat. Stop when the user presses Enter by itself (the input is empty).

strInput = readline.chomp

while strInput != ""
  puts strInput
  strInput = readline.chomp
end
