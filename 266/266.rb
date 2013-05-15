require 'sinatra'
require './connect_to_db.rb'

get("/orders") do
  @orders = G197Order.order("id")
  halt erb(:orders)
end

get("/order/:order_id") do
  order_no = params["order_id"]
  @order = G197Order.where(id: "#{order_no}").first

  if @order != nil
    halt erb(:order)
  else
    halt 404, "The requested order not found"
  end
end
