require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin

get("/") do
  halt erb(:order_form)
end

post("/post_handler") do
  order = SubOrder.new
  order.sandwich_type     =  params["sandwich_type"]
  order.bread_type        =  params["bread_type"]
  order.want_12_inch      = (params["want_12_inch"]      != nil)
  order.want_extra_cheese = (params["want_extra_cheese"] != nil)
  order.want_chips        = (params["want_chips"]        != nil)

  total_cost  = 3.49
  total_cost += 2.00 if order.want_12_inch
  total_cost += 0.49 if order.want_extra_cheese
  total_cost += 0.99 if order.want_chips
  order.total_order = total_cost.round(2)

  order.save!

  halt erb(:thank_you)
end

get("/orders") do
  @orders = SubOrder.all
  halt erb(:sub_orders)
end
