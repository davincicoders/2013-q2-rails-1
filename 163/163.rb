# The intention of this program is to reverse a list of words,
# but there are bugs.  Find and fix the bug to make the tests pass.
require "pry"
puts "Enter a list of words, separated by spaces (e.g. big green frog):"
input = readline.chomp
words = input.split(" ")
reversed_words = words
for i in 0..(words.size)
  reversed_words[i] = reversed_words[words.size - i]
end
puts reversed_words.join(" ")

binding.pry
big, green, frog.reverse

