require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'
require 'pry'

register SinatraMore::MarkupPlugin
rand1 = 0
rand2 = 0

get("/") do
  rand1 = rand(9)
  rand2 = rand(9)
  @rand1 = rand1
  @rand2 = rand2
  halt erb(:form)
end

post("/form_post") do
  # TODO: fill this in
  cus = ContactUsSubmission.new
  cus.full_name = params["name_entered"]
  cus.email = params["email_entered"]
  cus.website = params["website_entered"]
  cus.country = params["country_entered"]
  cus.comment_suggest = params["comments_entered"]
  test = params["human_entered"]
#  binding.pry
  if (rand1 + rand2) == test.to_i
    cus.save
  end
  halt erb(:thank_you)
end
