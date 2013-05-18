require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin

get("/") do
  halt erb(:order_form)
end

post("/handle_post") do
  # TODO: save the sub order into the sub_orders table.
  # Make sure to fill out:
  # - sandwich_type (string)
  # - bread_type (string)
  # - want_12_inch (true or false)
  # - want_extra_cheese (true or false)
  # - want_chips (true or false)
  # - total_order (a float. for example: 3.49)
  order = SubOrder.new
  order.sandwich_type = params["sand_type"]
  order.bread_type = params["bread_type"]
  order.want_12_inch = params["upgrade"]
  order.want_extra_cheese = params["extra"]
  order.want_chips = params["add"]
  total = 3.49
  total += 2.0 if order.want_12_inch
  total += 0.49 if order.want_extra_cheese
  total += 0.99 if order.want_chips
  order.total_order = total.round(2)
  order.save
  halt erb(:thank_you)
end

get("/orders") do
  @orders = SubOrder.all
  halt erb(:sub_orders)
end
