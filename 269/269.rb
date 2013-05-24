require 'sinatra'
require 'sinatra_more/markup_plugin'

register SinatraMore::MarkupPlugin

get("/") do
  halt erb(:form)
end
