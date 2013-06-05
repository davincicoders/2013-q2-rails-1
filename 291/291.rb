require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'
require 'pry'

use Rack::Session::Cookie, secret: SecureRandom.hex
<<<<<<< HEAD
=======

>>>>>>> 85819fa6c72ddce1067aea67b4b246ad947ff7cb
register SinatraMore::MarkupPlugin

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
<<<<<<< HEAD
  @found_user = SubAdmin.where(id: session["sub_user_id"]).first
  if @found_user == nil
    redirect "/login"
  else
    @orders = SubOrder.all
    halt erb(:sub_orders)
  end
end


get "/login" do
  halt erb(:login)
end

post "/login" do
  found_user = SubAdmin.where(username: params["username"]).first
  if found_user && params["password"] == found_user.password
    session["sub_user_id"] = found_user.id
    redirect "/orders"
  else
    halt erb(:login)
  end
end
=======


  @orders = SubOrder.all

 #  @bank_user = BankUser.where(id: session["bank_user_id"]).first
#   if @bank_user == nil
#     redirect "/login"
#   else
#     halt erb(:accounts)
#   end
  halt erb(:sub_orders)
end

get "/login"  do
  halt erb(:login, layout: false)
end

post "/login" do
  found_admin_user = BankUser.where(username: params["username"]).first
  if found_bank_user && params["password"] == found_bank_user.password
    session["bank_user_id"] = found_bank_user.id
    redirect "/accounts"
  else
    halt erb(:login, layout: false)
  end
end

>>>>>>> 85819fa6c72ddce1067aea67b4b246ad947ff7cb
