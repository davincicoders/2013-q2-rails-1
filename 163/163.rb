#require "pry"
# The intention of this program is to reverse a list of words,
# but there are bugs.  Find and fix the bug to make the tests pass.
#binding.pry
puts "Enter a list of words, separated by spaces (e.g. big green frog):"
input = readline.chomp
words = input.split(" ")
words = words.reverse
puts words.join(" ")
