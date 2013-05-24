require './connect_to_db.rb'

#Cat.destroy_all

#Cat.create(name: "Fluffy", location: "under the bed")
#Cat.create(name: "Furry", location: "under the bed")
#Cat.create(name: "Felix", location: "under the bed")

cat = Cat.new

puts "Enter a cat's name"
cat.name = readline.chomp

while cat.save == false
  for error in cat.errors.full_messages
    puts error
  end
  puts "Enter a cat's name"
  cat.name = readline.chomp
end
