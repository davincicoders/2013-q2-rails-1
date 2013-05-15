require 'sinatra'
require './connect_to_db.rb'

get("/orders") do
  @orders = G197Order.order("id")
  halt erb(:orders)
end


get("/order/:order_number") do
  order_no = params["order_number"]
  @order_no = G197Order.where(id: order_no).first.
  halt erb(:order)
end



# TODO: Write a GET handler for paths like /order/1 and /order2.
# It should render an ERb file to look like order-mock-up.html
