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
  halt erb(:login)
end

get "/login" do
  @user = CarShareMember.new #need help with this
  halt erb(:login)
end

post "/login" do
  #member 
  @user = CarShareMember.where(username: params["username"]).first
  if member && member.authenticate(params["password"])
    flash.now[:success] = "Correct login"
  redirect "/reservations"
  else
   flash.now[:error] = "Incorrect login"
  end
  halt erb(:login)
end

get "/reservations" do
  @member = CarShareMember.where(username: session["car_share_member_username"]).first
   #if @member == nil
   # redirect "/login"
  #else
    @cars = Car.order("id")
   halt erb(:reservations)
 end
