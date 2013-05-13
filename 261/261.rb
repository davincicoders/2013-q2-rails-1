require 'sinatra'
require './connect_to_db.rb'

get("/") do
  @elements = Element.order("name")
  halt erb(:elements)
end
