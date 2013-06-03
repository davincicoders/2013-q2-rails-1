require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

use Rack::Session::Cookie, secret: SecureRandom.hex
register SinatraMore::MarkupPlugin

get ("/login")  do
  halt erb(:login, layout: false)
end

post ("/login") do
  found_user = SubAdmin.where(username: params["username"]).first
  if found_user && params["password"] == found_user.password
    session["user_id"] = found_user.id
    redirect "/orders"
  else
    halt erb(:login, layout: false)
  end
end

post ("/logout") do
  session.clear
  redirect "/orders"
end

get("/") do
  halt erb(:order_form)
end

post("/handle_post") do
  order = SubOrder.new
  order.sandwich_type     =  params["sandwich_type"]
  order.bread_type        =  params["bread_type"]
  order.want_12_inch      = (params["want_12_inch"]      != nil)
  order.want_extra_cheese = (params["want_extra_cheese"] != nil)
  order.want_chips        = (params["want_chips"]        != nil)

  total_cost  = 3.49
  total_cost += 2.00 if order.want_12_inch
  total_cost += 0.49 if order.want_extra_cheese
  total_cost += 0.99 if order.want_chips
  order.total_order = total_cost.round(2)

  order.save!

  halt erb(:thank_you)
end

get("/orders") do
  @user = SubAdmin.where(id: session["user_id"]).first
  if @user == nil
    redirect "/login"
  else
    @orders = SubOrder.all
    halt erb(:sub_orders)
  end
end
