require 'sinatra'
require 'sinatra_more/markup_plugin'
require 'json'
require './connect_to_db.rb'

use Rack::Session::Cookie, secret: SecureRandom.hex

after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError

register SinatraMore::MarkupPlugin

get "/"  do
  redirect "/login"
end

get "/login"  do
  halt erb(:login)
end

post "/login" do
  admin = PropertyAdmin.where(username: params["username"]).first
  if admin != nil && params["password"] == admin.password
    session["property_admin_id"] = admin.id
    redirect "/properties"
  else
    halt erb(:login)
  end
end

get "/properties" do
  @admin = PropertyAdmin.where(id: session["property_admin_id"]).first
  if @admin == nil
    redirect "/login"
  else
    @properties = Property.order("id")
    halt erb(:properties)
  end
end

get "/properties/:property_id" do
  @admin = PropertyAdmin.where(id: session["property_admin_id"]).first
  if @admin.nil?
    redirect "/login"
  else
    @property = Property.where(id: params["property_id"]).first
    halt erb(:property)
  end
end

post "/properties/:property_id" do
  @admin = PropertyAdmin.where(id: session["property_admin_id"]).first
  if @admin.nil?
    redirect "/login"
  else
    @property = Property.where(id: params["property_id"]).first
    @property.address      = params["address"]
    @property.price        = params["price"]
    @property.num_bedrooms = params["num_bedrooms"]
    @property.image_url    = params["image_url"]
    @property.save!
    redirect "/properties"
  end
end

post "/logout" do
  session.clear
  redirect "/login"
end
