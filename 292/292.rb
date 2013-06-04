require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

use Rack::Session::Cookie, secret: SecureRandom.hex
after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError

register SinatraMore::MarkupPlugin

get "/"  do
  redirect "/login"
end

get "/login"  do
  halt erb(:login, layout: false)
end

post "/login" do
  found_admin = PropertyAdmin.where(username: params["username"]).first
  if found_admin && params["password"] == found_admin.password
    session["found_admin_id"] = found_admin.id
    redirect "/properties"
  else
    halt erb(:login, layout: false)
  end
end

get "/properties" do
  @admin = PropertyAdmin.where(id: session["found_admin_id"]).first
  if @admin == nil
    redirect "/login"
  else
    @properties = Property.order("id").all
    halt erb(:properties)
  end
end

post "/properties" do
  if params["edit"]
    property = Property.where(id: params["edit"]).first
    redirect "/property/#{property.id}"
  elsif params["delete"]
    property_id = params["delete"]
    property = Property.where(id: property_id).first
    property.destroy
    redirect "/properties"
  elsif params["new"]
    redirect "/property/new"
  end
end

get "/property/:property_id" do
  @admin = PropertyAdmin.where(id: session["found_admin_id"]).first
  if @admin == nil
    redirect "/login"
  else
    if params["property_id"] == "new"
      @property = Property.new
    else
      @property = Property.where(id: params["property_id"]).first
    end
  end
    halt erb(:property)
end

post "/property/:property_id" do
  if params["property_id"] == "new"
    new_property               = Property.new
    new_property.address       = params["address"]
    new_property.price         = params["price"]
    new_property.num_bedrooms  = params["num_bedrooms"]
    new_property.num_stories   = params["num_stories"]
    new_property.num_square_feet = params["num_square_feet"]
    new_property.image_url     = params["image_url"]
    new_property.save!
    
    redirect "/properties"

  else
    @property                 = Property.where(id: params["property_id"]).first
    @property.address         = params["address"]
    @property.price           = params["price"]
    @property.num_bedrooms    = params["num_bedrooms"]
    @property.num_stories     = params["num_stories"]
    @property.num_square_feet = params["num_square_feet"]
    @property.image_url       = params["image_url"]
    if @property.save
      redirect "/properties"
    else
      halt erb(:property)
    end
  end
end