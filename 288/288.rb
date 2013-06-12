require 'sinatra'
require 'json'
require './connect_to_db.rb'

use Rack::Session::Cookie, secret: SecureRandom.hex
after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError

get "/"  do
  redirect "/login"
end

get "/login"  do
  halt erb(:login, layout: false)
end

post "/login" do
  found_bank_user = BankUser.where(username: params["username"]).first
  if found_bank_user && params["password"] == found_bank_user.password
    session["bank_user_id"] = found_bank_user.id
    redirect "/accounts"
  else
    halt erb(:login, layout: false)
  end
end

SAFE_PAGES = ["/", "/login"]
before do
  @bank_user = BankUser.where(id: session["bank_user_id"]).first
  if !SAFE_PAGES.include?(request.path_info) && @bank_user.nil?
    redirect "/login"
  end
end
  
get("/accounts") { halt erb(:accounts) }

get("/location") { halt erb(:location) }

get("/rates") { halt erb(:rates) }

get "/logout" do
  session.clear
  redirect "/login"
end
