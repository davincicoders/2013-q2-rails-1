# The intention of this program is to reverse a list of words,
# but there are bugs.  Find and fix the bug to make the tests pass.


puts "Enter a list of words, separated by spaces (e.g. big green frog):"
input = readline.chomp
words = input.split(" ")
reversed_words = []
for i in 0..(words.size - 1)
  reversed_words[i] = words[(words.size - 1) - i]
end
puts reversed_words.join(" ")