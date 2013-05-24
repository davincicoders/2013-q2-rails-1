require 'sinatra'
require './connect_to_db.rb'

get ("/properties") do
  @orders=G197Order.order("id")
  halt erb(:orders)
end
