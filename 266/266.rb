require 'sinatra'
require './connect_to_db.rb'

get("/orders") do
  @orders = G197Order.order("id")
  halt erb(:orders)
end

get("/order/:order_id") do
  order_id = params["order_id"]
  @order = G197Order.where(id: order_id).first
  halt erb(:order)
end
