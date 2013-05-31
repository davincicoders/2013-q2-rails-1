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
    if params["party_size"].to_i > @table.number_of_chairs
      @error = "Table only has #{@table.number_of_chairs} chairs"
      halt erb(:show_table)
    else
      @order = RestaurantOrder.new
      @order.party_size          = params["party_size"]
      @order.restaurant_table_id = params["table_id"]
      @order.is_closed           = false
      @order.save!
    end
  elsif params["action"] == "add_item_to_order"
    @item = OrderedMenuItem.new
    @item.restaurant_order_id = order.id
    @item.menu_item_id = params["menu_item_id"]
    @item.chair_number = params["chair_number"]
    if @item.save
      redirect "/table/#{@table.id}"
    else
      halt erb(:show_table)
    end
  elsif params["action"] == "close_out"
    @order.is_closed = true
    @order.save!
  end
  redirect "/table/#{@table.id}"
end
