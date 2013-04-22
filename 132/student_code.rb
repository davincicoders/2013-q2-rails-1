intPrompt = ""
intRuntotal = 0

intPrompt = readline.chomp

while intPrompt != ""
  intRuntotal += intPrompt.to_i
  intPrompt = readline.chomp
end

puts intRuntotal
