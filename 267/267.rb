require 'sinatra'
require './connect_to_db.rb'

get("/") do
  @properties = Property.all
  halt erb(:properties)
end

get("/property/:number") do
  page_num = params["number"]
  @property = Property.where(id: page_num).first
  halt erb(:property)
end
