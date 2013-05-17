require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

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

  tuna = SushiDish.where(name: "Tuna").first
  squid = SushiDish.where(name: "Squid").first

  order = SushiOrder.new
  order.table_number = 17
  order.total_price = 14.00 # 5.00 + 4.50 + 4.50 = 14.00
  order.save!

  line_item = SushiOrderLineItem.new
  line_item.sushi_dish = tuna
  line_item.sushi_order = order
  line_item.quantity = 1
  line_item.line_price = 5.00 # $5.00 x 1 = $5.00
  line_item.save!

  line_item = SushiOrderLineItem.new
  line_item.sushi_dish = squid
  line_item.sushi_order = order
  line_item.quantity = 2
  line_item.line_price = 9.00 # $4.50 x 2 = $9.00
  line_item.save!

  halt erb(:thank_you)
end

get("/orders") do
  @orders = SushiOrder.order("id")
  halt erb(:orders)
end
