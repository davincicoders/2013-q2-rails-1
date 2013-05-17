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

  halt erb(:thank_you)
end

get("/orders") do
  @orders = SubOrder.all
  halt erb(:sub_orders)
end
