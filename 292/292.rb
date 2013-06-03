require './connect_to_db.rb'
require 'sinatra'
require 'sinatra_more/markup_plugin'

use Rack::Session::Cookie, secret: SecureRandom.hex
register SinatraMore::MarkupPlugin

SAFE_PAGES = ["/login"]
before do
  @property_admin = PropertyAdmin.where(id: session["property_admin_id"]).first
  if !SAFE_PAGES.include?(request.path_info) && @property_admin == nil
    redirect "/login"
  end
end

get ("/") do
  @property_admin = PropertyAdmin.where(id: session["property_admin_id"]).first
  @properties = Property.all
  halt erb(:edit_properties)
end

get ("/login") do
  @user = PropertyAdmin.new
  halt erb(:login, layout: false)
end

post ("/login") do
  @user = PropertyAdmin.new
  @user.username = params["username"]
  verify = PropertyAdmin.where(username: params["username"]).first
  if verify && verify.password == params["password"]
    session["property_admin_id"] = verify.id
    redirect "/"
  else
    halt erb(:login, layout: false)
  end
end

post ("/logout") do
  session.clear
  redirect "/"
end

get ("/:property_id") do
  @property = Property.where(id: params["property_id"]).first
  @property_admin = PropertyAdmin.where(id: session["property_admin_id"]).first
  halt erb(:edit_property)
end

post ("/:property_id") do
  @property = Property.where(id: params["property_id"]).first
  @property.address = params["address"]
  @property.price = params["price"]
  @property.num_bedrooms = params["bedrooms"]
  @property.image_url = params["image_url"]
  if @property.save
    redirect "/"
  else
    halt erb(:edit_property)
  end
end
