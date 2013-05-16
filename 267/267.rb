require 'sinatra'
require './connect_to_db.rb'


get("/properties") do
@houses = Property.all
halt erb(:homes)
end


get("/property/:property_address") do
house = params["property_address"]
@home = Property.where(address: house).first
halt erb(:home)
end

