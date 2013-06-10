require 'sinatra'
require 'sinatra_more/markup_plugin'
require 'rack-flash'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin
after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError
use Rack::Session::Cookie, secret: SecureRandom.hex
use Rack::Flash, sweep: true

# TODO: write request handlers below

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
  @cars = Car.all
  @car = Car.where(car_share_member_id: session["user_id"]).first
  halt erb(:reservations)
end

post "/reservations" do
  
  halt erb(:reservations)
end

post "/return" do
  car = Car.where(car_share_member_id: session["user_id"]).first
  car.car_share_member_id = ""
  car.save
  halt erb(:reservations)
end
