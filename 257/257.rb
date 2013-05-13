require 'sinatra'
require './connect_to_db.rb'

get("/") do
  @colors = Color.all
  halt erb(:colors)
end
