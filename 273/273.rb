require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin

after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError

get("/") do
  halt erb(:order_form)
end

post "/sub_orders" do
  @order                    = SubOrder.new
  @order.sandwich_type      = params["sandwich_type"]
  @order.bread_type         = params["bread_type"]
  @order.want_12_inch       = params["want_12_inch"]
  @order.want_extra_cheese  = params["want_extra_cheese"]
  @order.want_chips         = params["want_chips"]
  @order.total_order        = params["total_order"]

  @order.total_order = 3.49
    if @order.want_12_inch == true
      @order.total_order = @order.total_order + 2.00
    end
    if @order.want_extra_cheese == true
      @order.total_order  = @order.total_order + 0.49
    end
    if @order.want_chips == true
      @order.total_order = @order.total_order + 0.99
    end

  if @order.save
    halt erb(:sub_orders)
  else
    redirect "/thank_you"
  end
end

get "/sub_orders" do
  halt erb(:sub_orders)
end

