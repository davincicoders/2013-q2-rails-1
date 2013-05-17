require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin

get("/") do
  halt erb(:form)
end

post("/post_handler") do
  # TODO: fill this in

  halt erb(:thank_you)
end
