class MainController < ApplicationController
  def root
    render :choose_table and return
  end

  def table
    @table = RestaurantTable.where(id: params["table_id"]).first
    @order = RestaurantOrder.where(
      is_closed: false, restaurant_table_id: @table.id).first
    render :show_table and return
  end

  def table_post
    @table = RestaurantTable.where(id: params["table_id"]).first
    @order = RestaurantOrder.where(
      is_closed: false, restaurant_table_id: @table.id).first
    if @order.nil?
      if params["party_size"].to_i > @table.number_of_chairs
        @error = "Table only has #{@table.number_of_chairs} chairs"
        render :show_table and return
      else
        @order = RestaurantOrder.new
        @order.party_size          = params["party_size"]
        @order.restaurant_table_id = params["table_id"]
        @order.is_closed           = false
        @order.save!
      end
    elsif params["button"] == "add_item_to_order"
      @item = OrderedMenuItem.new
      @item.restaurant_order_id = @order.id
      @item.menu_item_id = params["menu_item_id"]
      @item.chair_number = params["chair_number"]
      if @item.save
        redirect_to "/table/#{@table.id}" and return
      else
        render :show_table and return
      end
    elsif params["button"] == "close_out"
      @order.is_closed = true
      @order.save!
    end
    redirect_to "/table/#{@table.id}" and return
  end
end
