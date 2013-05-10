require './connect_to_db.rb'

cat = Cat.where(name: "LeBron").first
cat.name = "LeBron James"
cat.save