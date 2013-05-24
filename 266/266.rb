require 'sinatra'
require './connect_to_db.rb'

get("/orders") do
  @orders = G197Order.order("id")
  halt erb(:orders)
end

# TODO: Write a GET handler for paths like /order/1 and /order2.
# It should render an ERb file to look like order-mock-up.html

get ("/order/:order_num") do
	order_num = params["order_num"]
	@order = G197Order.where(id: order_num.to_i).first
	
	if @order != nil
		halt erb(:order)
	else 
	halt 404, "Order not found"
	end
end
