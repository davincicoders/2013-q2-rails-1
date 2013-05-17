require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

set bind: "0.0.0.0"

register SinatraMore::MarkupPlugin

get("/") do
  halt erb(:form)
end
