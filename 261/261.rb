require 'sinatra'
require './connect_to_db.rb'

get("/") do
  @elements = Element.all
  halt erb(:elements)
end
