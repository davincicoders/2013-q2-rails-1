require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'
require "pry"

register SinatraMore::MarkupPlugin

get("/") do
  @dishes = SushiDish.all
  halt erb(:order_form)
end

post("/handle_post") do

#binding pry

tuna = SushiDish.where(name: "Tuna").first
squid = SushiDish.where(name: "Squid").first

order = SushiOrder.new
order.table_number = params["table_number"] 
order.total_price = 14.00 # 5.00 + 4.50 + 4.50 = 14.00
order.save!

line_item = SushiOrderLineItem.new
line_item.sushi_dish = tuna
line_item.sushi_order = order
line_item.quantity = 1
line_item.line_price = 5.00 # $5.00 x 1 = $5.00
line_item.save

line_item = SushiOrderLineItem.new
line_item.sushi_dish = squid
line_item.sushi_order = order
line_item.quantity = 2
line_item.line_price = 9.00 # $4.50 x 2 = $9.00
line_item.save!

halt erb(:thank_you)
end

#Daniels solution
#  order = SushiOrder.new
#   order.table_number = params["table_number"]
#   order.total_price = 0.00
# 
#   for dish in SushiDish.all
#     line_item_price = 0.00
#     quantity = params["quantity_for_dish_#{dish.id}"].to_i
#     if quantity > 0
#       line_item             = SushiOrderLineItem.new
#       line_item.sushi_dish  = dish
#       line_item.sushi_order = order
#       line_item.quantity    = quantity
#       line_item.line_price  = dish.price * quantity
# 
#       order.total_price += line_item.line_price
#       order.sushi_order_line_items << line_item
#     end
#   end
# 
#   order.save!

#Saras solution
#   order = SushiOrder.new
#   order.table_number = params["table_number"]
#   order.total_price = 0
# 
# 	for dish in SushiDish.all
# 		quantity = params["quantity_for_dish_#{dish.id}"].to_i
# 		if quantity > 0
#   		line_item = SushiOrderLineItem.new
#   		line_item.sushi_dish = dish
#   		line_item.sushi_order = order
#   		line_item.quantity = quantity
#   		line_item.line_price = dish.price * quantity
#   		order.total_price += line_item.line_price 
#   		line_item.save!
#   	end
# 	end
# 	
# 	  order.save!
# 
#   halt erb(:thank_you)
# end
# 
 get("/orders") do
   @orders = SushiOrder.order("id")
   halt erb(:orders)
 end
