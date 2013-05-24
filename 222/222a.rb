require './connect_to_db.rb'

puts "Please enter your cat's name"
cat_name = readline.chomp
while cat_name == ''
  puts "Please enter your cat's name"
  cat_name = readline.chomp
end
Cat.create(name: cat_name)
