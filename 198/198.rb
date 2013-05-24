require './connect_to_db.rb'

puts "Please enter an episode name:"
episode_name = readline.chomp
episode = G198Episode.where(name: episode_name).first
collectibles = G198Collectible.where(g198_episode_id: episode.id)
for collectible in collectibles
  puts collectible.name
end
