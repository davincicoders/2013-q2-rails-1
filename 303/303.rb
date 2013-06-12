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
	@user = CarShareMember.where(username params["username"]).first
	if @user == nil || @user.authenticate(params["password"])
		flash[:error] = "Please enter a valid username and password."
		redire "/login"
	else
	 session["user"] = @user.id
	 redirect "/reservations"
	end
end

get "/reservations" do
	@user = CarShareMember.where(id: session["user"]).first
	@cars = Car.order(id)
end

post "/reservations" do
	if params["logout"]
		session.clear
		redirect "/login"
	elsif params["Return this car"]
	elsif params["Reserve"]
	end
end
