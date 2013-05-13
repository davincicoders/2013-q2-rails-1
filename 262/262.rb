require 'sinatra'
require './connect_to_db.rb'

get("/") do
  @g197_orders = G197Order.all
  halt erb(:g197_orders)
end
