require 'sinatra'
require './connect_to_db.rb'


get("/") do
  @properties = Property.order("id")
  halt erb(:properties)
end

get("/property/:id") do
  id = params["id"]
  @property = Property.where(id: id).first

  if @property != nil
    halt erb(:property)
  else
    halt 404, "The requested property not found"
  end
end
