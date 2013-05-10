require './connect_to_db.rb'

cat = Cat.new
cat.name = 'LeBron'
cat.location = 'Miami'

cat.save