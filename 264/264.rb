require 'sinatra'
require './connect_to_db.rb'

get("/") do
  @specials = TodaysSpecial.all
  halt erb(:todays_specials)
end
