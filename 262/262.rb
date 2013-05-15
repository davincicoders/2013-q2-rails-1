require 'sinatra'
require './connect_to_db.rb'

get("/") do
  @orders = G197Order.all
  halt erb(:g197orders)
end
