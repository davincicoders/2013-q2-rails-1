require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'
#require 'pry'

register SinatraMore::MarkupPlugin

get("/") do
  halt erb(:form)
end

post("/post_handler") do
 # binding.pry

  submission = DemoFormSubmission.new
  submission.first_name = params["first_name"]
  submission.password   = params["password"]
  submission.message    = params["message"]
  submission.finished   = params["finished"]
  submission.gender     = params["gender"]
  submission.card_type  = params["card_type"]
  submission.save!

  halt erb(:thank_you)
end
