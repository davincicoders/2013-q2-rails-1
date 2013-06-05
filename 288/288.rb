require 'sinatra'
require 'json'
require './connect_to_db.rb'

use Rack::Session::Cookie, secret: SecureRandom.hex
after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError

SAFE_PAGES = ["/", "/rates", "/location", "/login", "/logout"]
before do
  @bank_user = BankUser.where(id: session["bank_user_id"]).first
  if !SAFE_PAGES.include?(request.path_info) && @bank_user == nil
    redirect "/login"
  end
end

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

get "/accounts" do
  @bank_user = BankUser.where(id: session["bank_user_id"]).first
  if @bank_user == nil
    redirect "/login"
  else
    halt erb(:accounts)
  end
end

get "/location" do
  @bank_user = BankUser.where(id: session["bank_user_id"]).first
  if @bank_user.nil?
    halt erb(:location, layout: false)
  else
    halt erb(:location)
  end
end

get "/rates" do
  @bank_user = BankUser.where(id: session["bank_user_id"]).first
  if @bank_user.nil?
    halt erb(:location, layout: false)
  else
    halt erb(:rates)
  end
end

get "/logout" do
  session.clear
  redirect "/login"
end
