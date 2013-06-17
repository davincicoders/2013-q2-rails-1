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
  # find a user with the username that the user posted from the form
  @user = CarShareMember.where(username: params["username"]).first

  # check if that user exists and their password is correct.
  if @user != nil && @user.authenticate(params["password"])
    # if so, save the user's ID to session and redirect to /reservations
    session[:car_share_member_id] = @user.id
    redirect "/reservations"
  else
    # if not, redirect to login page again with a flash message:
    #   "Unknown username or wrong password."
    flash[:error] = "Unknown username or wrong password."
    redirect "/login"
  end
end

get "/reservations" do
  # check if there's a user ID saved in the session
  if session[:car_share_member_id] != nil
    # If so, load a variable named @user, and show the reservations ERb.
    @user = CarShareMember.where(id: session[:car_share_member_id]).first
    @car = Car.where(car_share_member_id: @user.id).first
    halt erb(:reservations)
  else
    # If not, redirect to the login page.
    redirect "/login"
  end
end

post "/reservations" do
  if params["logout"]
    session.clear
    redirect "/login"
  elsif params["return_this_car"] 
    car = Car.where(car_share_member_id: session[:car_share_member_id]).first
    car.car_share_member_id = nil
    car.save!
    redirect "/reservations"
  elsif params["reserve_this_car"] 
    car = Car.where(id: params["reserve_this_car"]).first
    car.car_share_member_id = session[:car_share_member_id]
    car.save!
    redirect "/reservations"
  else
    halt 500, "Unknown button pressed with name #{params}"
  end
end
