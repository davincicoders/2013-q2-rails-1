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
  @user = CarShareMember.new
  halt erb(:login)
end

post "/login" do
  
    @user = CarShareMember.where(username: params["username"]).first
     if @user != nil && @user.authenticate(params["password"])
      session[:car_share_member_id] = @user.id
      redirect"/reservations"
    else
      flash[:error] ="Unknown user or wrong password"
      redirect "/login"
    end
end

get "/reservations" do
  if session[:car_share_member_id] != nil
    @user = CarShareMember.where(id: session[:car_share_member_id]).first
    @car = Car.where(car_share_member_id: @user.id).first
    halt erb(:reservations)
  else
    redirect "/login"
  end
end

post "/reservations" do
  if params["logout"] != nil
    session.clear
    redirect "/login"
  elsif params["return_car"] != nil
    car = Car.where(car_share_member_id: session[:car_share_member_id]).first
    car.car_share_member_id = nil
    car.save!
    redirect "/reservations"
  else params["reserve_car"] != nil
    car = Car.where(id: params["reserve_car"]).first
    car.car_share_member_id = session[:car_share_member_id]
    car.save
    redirect"/reservations"
  end
end

