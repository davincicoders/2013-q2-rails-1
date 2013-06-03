require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'
require 'pry'

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
  binding.pry
  @table = RestaurantTable.where(id: params["table_id"]).first
  @order = RestaurantOrder.where(
    is_closed: false, restaurant_table_id: @table.id).first
  if @order.nil?
<<<<<<< Updated upstream
    # TODO: mark a table as occupied, complaining if there aren't
    #       enough seats for the party.
=======
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
  
>>>>>>> Stashed changes
  elsif params["action"] == "add_item_to_order"
    # TODO: add an item to the order, complaining if an item or
    #       chair number wasn't picked.
  elsif params["action"] == "close_out"
    # TODO: close out an order.
  end
  redirect "/table/#{@table.id}"
end
