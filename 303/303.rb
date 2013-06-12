require 'sinatra'
require 'sinatra_more/markup_plugin'
require 'rack-flash'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin
after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError
use Rack::Session::Cookie, secret: SecureRandom.hex
use Rack::Flash, sweep: true

SAFE_PAGES = ["/", "/login"]
before do
	@user = CarShareMember.where(id: session["user"]).first
	if !SAFE_PAGES.include?(request.path_info) && @user.nil?
		redirect "/login"
	end
end

get("/") { redirect "/login" }

get("/login") { halt erb(:login) }

post("/login") do
	@user = CarShareMember.where(username: params["username"]).first
	if @user != nil && @user.authenticate(params["password"])
	  session["user"] = @user.id
	  redirect "/reservations"
	else
	  flash[:error] = "Please enter a valid username and password."
		redirect "/login"
	end
end

get "/reservations" do
	@car = Car.where(car_share_member_id: session["user"]).first
	halt erb(:reservations)
end

post "/reservations" do
	if params["Logout"]
		session.clear
		redirect "/login"
	elsif params["Return this car"]
	  car = Car.where(id: @user.cars.first.id).first
	  car.car_share_member_id = null
	  car.save!
	  redirect "/reservations"
	elsif params["Reserve"]
	  car = Car.where(id: params["Reserve"]).first
	  car.car_share_member_id = @user.id
	  car.save!
	  halt erb(:reservations)
	end
end
