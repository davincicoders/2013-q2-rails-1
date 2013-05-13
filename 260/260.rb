require 'sinatra'
require './connect_to_db.rb'

get("/") do
  @episodes = G198Episode.all
  halt erb(:episodes)
end
