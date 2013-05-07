require './connect_to_db.rb'

collectibles = G198Collectible.order("id")
for collectible in collectibles
	puts collectible.name
	puts collectible.g198_category.name
end
