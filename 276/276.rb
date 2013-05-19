require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin

after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError

get "/" do
  redirect "/contact_us"
end

get "/contact_us" do
  halt erb(:contact_us)
end

post "/contact_us_post" do
  @message         = ContactUsMessage.new
  @message.name    = params["name"]
  @message.email   = params["email"]
  @message.message = params["message"]

  if @message.save
    redirect "/thank_you"
  else
    halt erb(:contact_us_post)
  end
end

get "/thank_you"  do
  halt erb(:thank_you)
end
