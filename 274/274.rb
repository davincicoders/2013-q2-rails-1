require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin

get("/") do
  @dishes = SushiDish.all
  halt erb(:order_form)
end

post("/handle_post") do
  order = SushiOrder.new
  order.table_number = params["table_number"]
  order.total_price = 0.00

  for dish in SushiDish.all
    line_item_price = 0.00
    quantity = params["quantity_for_dish_#{dish.id}"].to_i
    if quantity > 0
      line_item             = SushiOrderLineItem.new
      line_item.sushi_dish  = dish
      line_item.sushi_order = order
      line_item.quantity    = quantity
      line_item.line_price  = dish.price * quantity

      order.total_price += line_item.line_price
      order.sushi_order_line_items << line_item
    end
  end

  order.save!

  halt erb(:thank_you)
end

get("/orders") do
  @orders = SushiOrder.order("id")
  halt erb(:orders)
end
