require 'sinatra'
require './connect_to_db.rb'

get ("/") do
  @elements = Element.all
  halt erb(:elements)
end



=begin
get("/") do
  @colors = Color.all
  halt erb(:colors)
end
=end