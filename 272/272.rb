require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin

get("/") do
  halt erb(:form)
end

post("/post_handler") do
  submission = ContactUsSubmission.new
  submission.name = params["name"]
  submission.email = params["email"]
  submission.web_site = params["web_site"]
  submission.country = params["country"]
  submission.comments = params["comments"]
  submission.save!
  halt erb(:thank_you)
end
