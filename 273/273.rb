require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin

get("/") do
  halt erb(:order_form)
end

post("/post_handler") do
  submission = SubOrder.new 
  submission.sandwich_type = params["sandwich_type"]
  submission.bread_type = params["bread_type"]
  submission.want_12_inch = (params["want_12_inch"] != nil)
  submission.want_extra_cheese = (params["want_extra_cheese"] != nil)
  submission.want_chips = (params["want_chips"] != nil)
  
  
  total_cost  = 3.49
  total_cost += 2.00 if submission.want_12_inch
  total_cost += 0.49 if submission.want_extra_cheese
  total_cost += 0.99 if submission.want_chips
  submission.total_order = total_cost.round(2)
  
  submission.save!

  halt erb(:thank_you)
end

get("/orders") do
  @orders = SubOrder.all
  halt erb(:sub_orders)
end
