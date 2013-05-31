require 'sinatra'
require './connect_to_db.rb'

get("/") do
  @Us_Cities Table = UsCity.all
  halt erb(:us_cities)
end

# TODO: Write a handler for GET requests for path /.
#       It should return an HTML page that includes a <table> tag.
#       Each row of the <table> will visualize a row from the us_cities table.
#       Use the UsCity Active Record class.
#       Imitate the colors example (#257).

#get("/") do
  #@colors Table = Color.all
  #halt erb(:colors)
#end
