require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin

get("/") do
  halt erb(:order_form)
end

post("/handle_post") do
  new = SubOrder.new
  new.sandwich_type = params["sandwich_type"]
  new.bread_type = params["bread_type"]
  new.want_12_inch = params["upgrade"]
  new.want_extra_cheese = params["extra"]
  new.want_chips = params["add"]
  money = 3.49 
    if params["upgrade"]
      money = money + 2.00
    end
    if params["extra"]
      money = money + 0.49
    end
    if params["add"]
      money = money + 0.99
    end
    new.total_order = money.round(2)
  
    new.save!
  
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
