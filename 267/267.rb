require 'sinatra'
require './connect_to_db.rb'

get("/property") do
	@properties = Property.order("id")
	halt erb(:properties)
end

get("/property/:id") do
	id = params["id"]
	@property = Property.where(id: id).first
	halt erb(:property)
end