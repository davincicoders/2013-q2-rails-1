# WARNING: this code is not secure, because it sets cookies without digitally
#          signing them.

require 'sinatra'
require './connect_to_db.rb'

after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError

get("/") do
  redirect("/login")
end

get("/login") do
  halt erb(:login, layout: false)
end

post "/login" do
  found_bank_user = BankUser.where(username: params["username"]).first
  if found_bank_user && params["password"] == found_bank_user.password
    response.set_cookie "bank_user_id", found_bank_user.id
    redirect "/accounts"
  else
    halt erb(:login, layout: false)
  end
end

get "/accounts" do
  @bank_user = BankUser.where(id: request.cookies["bank_user_id"]).first
  if @bank_user == nil
    redirect "/login"
  else
    halt erb(:accounts)
  end
end

get "/location" do
  @bank_user = BankUser.where(id: request.cookies["bank_user_id"]).first
  if @bank_user == nil
    redirect "/login"
  else
    halt erb(:location)
  end
end

get "/rates" do
  @bank_user = BankUser.where(id: request.cookies["bank_user_id"]).first
  if @bank_user == nil
    redirect "/login"
  else
    halt erb(:rates)
  end
end

get "/logout" do
  response.delete_cookie "bank_user_id"
  redirect "/login"
end
