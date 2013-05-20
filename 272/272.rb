require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin

get("/") do
  halt erb(:form)
end

post("/post_handler") do
  submission = ContactUsSubmission.new
  submission.your_name = params["your_name"]
  submission.email     = params["email"]
  submission.website   = params["website"]
  submission.country   = params["country"]
  submission.comments  = params["comments"]
  submission.save!

  halt erb(:thank_you)
end
