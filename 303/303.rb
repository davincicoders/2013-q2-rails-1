require 'sinatra'
require 'sinatra_more/markup_plugin'
require 'rack-flash'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin
after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError
use Rack::Session::Cookie, secret: SecureRandom.hex
use Rack::Flash, sweep: true

# TODO: write request handlers below

SAFE_PAGES = ["/", "/login"]
before do
  @user = CarShareMember.where(id: session["user_id"]).first
  if !SAFE_PAGES.include?(request.path_info) && @user == nil
    flash[:error] = "Please log in."
    redirect "/login"
  end
end

get "/" do
  redirect "/login"
end

get "/login" do
  halt erb(:login)
end

post "/login" do
  user = CarShareMember.where(username: params["username"]).first
  if user && user.authenticate(params["password"])
    session["user_id"] = user.id
    redirect "/reservations"
  else
    flash[:error] = "Unknown username or wrong password."
    halt erb(:login)
  end
end

get "/reservations" do
  @user = CarShareMember.where(id: session["user_id"]).first
  @cars = Car.order("id")
  @car = Car.where(car_share_member_id: session["user_id"]).first
  halt erb(:reservations)
end

post "/reservations" do
  @user = CarShareMember.where(id: session["user_id"]).first
  @cars = Car.order("id")
  @car = Car.where(car_share_member_id: session["user_id"]).first
  if params["logout"] != nil
    session.clear
    redirect "/login"
  end
  if params["return_this_car"] != nil
    ret_car = Car.where(car_share_member_id: session["user_id"]).first
    ret_car.car_share_member_id = ""
    ret_car.save
    redirect "/reservations"
  end
  if params["reserve_this_car"] != nil
    reserve_car = Car.where(id: params["reserve_this_car"]).first
    reserve_car.car_share_member_id = session["user_id"]
    reserve_car.save
    redirect "/reservations"
  end
end
