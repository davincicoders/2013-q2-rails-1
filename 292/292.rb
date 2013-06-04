require 'sinatra'
require 'json'
require './connect_to_db.rb'
require 'sinatra_more/markup_plugin'
require 'pry'
register SinatraMore::MarkupPlugin

use Rack::Session::Cookie, secret: SecureRandom.hex

get "/" do 
  redirect "/login"
end

get "/login" do
  halt erb(:admin_login)
end

post "/login" do
  user = PropertyAdmin.where(username: params["username"]).first
  if user && params["password"] == user.password
  	session["user_id"] = user.id
  	redirect "/properties"
  else
  	@error = "Invalid username and/or password."
  	halt erb(:admin_login)
  end
end

post "/logout" do
  session.clear
  redirect "/login"
end

get "/properties" do
  @user = PropertyAdmin.where(id: session["user_id"]).first
  if @user.nil?
    redirect "/login"
  else
    @properties = Property.order("id")
    halt erb(:edit_properties)
  end
end

get "/property/:property_id" do
  @user = PropertyAdmin.where(id: session["user_id"]).first
  if @user == nil
    redirect "/login"
  else
    @property = Property.where(id: params["property_id"]).first
    halt erb(:edit_property)
  end
end

post "/property/:property_id" do
  @user = PropertyAdmin.where(id: session["user_id"]).first
  if @user == nil
    redirect "/login"
  else
    @property = Property.where(id: params["property_id"]).first
    @property.address 	     = params["address"]
    @property.price			     = params["price"]
    @property.num_bedrooms   = params["num_bedrooms"].to_i
    @property.image_url		   = params["image_url"]
    if @property.save
    	redirect "/properties"
    else
    	halt erb(:edit_property)
    end
  end
end 