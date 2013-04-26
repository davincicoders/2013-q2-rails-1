require "pry"

#binding.pry

list = []

file = File.read("colorado-cities.csv")
list = file.to_s.split("\n")

for i in 1..(list.size - 1)
  list[i] = list[i].split(",")
  puts list[i][0] if list[i][3].to_i <= 500000 
end
