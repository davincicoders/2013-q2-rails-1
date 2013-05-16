require 'sinatra'
require './connect_to_db.rb'

get("/orders") do
  @orders = G197Order.order("id")
  halt erb(:orders)
end

# TODO: Write a GET handler for paths like /order/1 and /order2.
# It should render an ERb file to look like order-mock-up.html

get("/order/order?:number?") do
  number = params["number"] #WORKS!! Returns number asked for in URL.  If /order2, returns 2. order3 returns 3, etc.
  
  @order = G197Order.where(id: number).first
  @order_num = number #Totally un-necissary, but good to know!
  
  halt erb(:order)
end
