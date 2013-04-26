require "pry"

# The intention of this program is to reverse a list of words,
# but there are bugs.  Find and fix the bug to make the tests pass.

#binding.pry

puts "Enter a list of words, separated by spaces (e.g. big green frog):"
input = readline.chomp
words = input.split(" ")
reversed_words = []
for i in 1..words.size
  reversed_words[(words.size - i)] = words[(i - 1)]
end
puts reversed_words.join(" ")
