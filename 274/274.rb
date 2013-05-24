require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'
require 'pry'

register SinatraMore::MarkupPlugin

get("/") do
  @dishes = SushiDish.all
  halt erb(:order_form)
end

post("/handle_post") do

  # TODO: The following code is an example of creating a 
  # sushi order.  But it always orders 1 tuna and 2 squid
  # for table #17.  Instead we want it to order whatever
  # the user entered in the form.
  #
  # Hint: submit an order, and when Pry comes up, type params
  #       to see the params variable.
  #
  # Hint: You could start by checking the quantity for tuna,
  #       then the quantity for squid, etc. by hand.
  #       Eventually you'll want to use a loop so that the
  #       chef can add new menu items without needing you to
  #       add Ruby code to support them.
  #get quantity of each using params.

  order = SushiOrder.new
  order.total_price = 0.0
  order.table_number = params["table_number"].to_i

  order_counter = []
  order_counter << params["quantity_for_dish_1"].to_i << params["quantity_for_dish_2"].to_i << params["quantity_for_dish_3"].to_i << params["quantity_for_dish_4"].to_i << params["quantity_for_dish_5"].to_i << params["quantity_for_dish_6"].to_i << params["quantity_for_dish_7"].to_i
  i = 1
  for o_O in order_counter
    if o_O > 0
      binding.pry
      sd = SushiDish.where(id: i).first
      order.total_price += (sd.price.to_f * o_O)
      
      line_item = SushiOrderLineItem.new
      line_item.sushi_dish = sd
      line_item.sushi_order = order
      line_item.quantity = o_O
      line_item.line_price = (sd.price * o_O)
      line_item.save!
    end
    i += 1
  end
  order.save

  halt erb(:thank_you)
end

get("/orders") do
  @orders = SushiOrder.order("id")
  halt erb(:orders)
end
