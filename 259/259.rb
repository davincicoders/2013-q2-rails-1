require 'sinatra'
require './connect_to_db.rb'

get("/") do
  @collectibles = G198Collectible.all
  halt erb(:collectibles)
end
