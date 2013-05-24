require 'sinatra'
require './connect_to_db.rb'

get ("/") do
  @orders = G197Order.all 
  halt erb(:orders)
end



=begin
get ("/") do
  @elements = Element.all
  halt erb(:elements)
end
=end


