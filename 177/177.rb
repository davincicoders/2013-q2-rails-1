file = File.open("input.txt", "r")
for line in file.each_line
  puts line
end
file.close
