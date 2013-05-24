require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin

after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError

get("/") do
  halt erb(:choose_table)
end

get("/table/:table_id") do
  @table = RestaurantTable.where(id: params["table_id"]).first
  @order = RestaurantOrder.where(
    is_closed: false, restaurant_table_id: @table.id).first
  halt erb(:show_table)
end

post("/table/:table_id") do
  @table = RestaurantTable.where(id: params["table_id"]).first
  @order = RestaurantOrder.where(
    is_closed: false, restaurant_table_id: @table.id).first
  if @order.nil?
    # TODO: mark a table as occupied, complaining if there aren't
    #       enough seats for the party.
  elsif params["action"] == "add_item_to_order"
    # TODO: add an item to the order, complaining if an item or
    #       chair number wasn't picked.
  elsif params["action"] == "close_out"
    # TODO: close out an order.
  end
  redirect "/table/#{@table.id}"
end
