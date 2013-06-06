require 'sinatra'
require 'sinatra_more/markup_plugin'
require 'json'
require 'rack-flash'
require './connect_to_db.rb'

use Rack::Session::Cookie, secret: SecureRandom.hex
use Rack::Flash, sweep: true

after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError

register SinatraMore::MarkupPlugin

get "/" do
  redirect "/login"
end

get "/login" do
  halt erb(:login)
end

post "/login" do
  named_user = G300User.where(username: params["username"]).first
  if named_user && named_user.authenticate(params["password"])
    flash[:success] = "Correct login"
  else
    flash[:error] = "Incorrect login"
  end
  redirect "/login"
end
