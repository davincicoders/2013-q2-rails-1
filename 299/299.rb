require 'sinatra'
require 'sinatra_more/markup_plugin'
require 'json'
require './connect_to_db.rb'

use Rack::Session::Cookie, secret: SecureRandom.hex

after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError

register SinatraMore::MarkupPlugin

before do
  @logged_in_user =
    G298User.where(:id => session[:logged_in_user_id]).first
end

get "/" do
  redirect "/users"
end

get "/users" do
  @users = G298User.order("id")
  halt erb(:index)
end

get "/users/new" do
  @user = G298User.new
  halt erb(:new)
end

post "/users" do
  @user = G298User.new
  @user.username = params["username"]
  @user.password = params["password"]
  @user.password_confirmation = params["password_confirmation"]
  if @user.save
    redirect "/users"
  else
    halt erb(:new)
  end
end

post "/login" do
  named_user = G298User.where(username: params["username"]).first
    if named_user.authenticate(params["password"])
    session[:logged_in_user_id] = named_user.id
    redirect "/users"
  else
    @error = "Wrong username or password"
  end
end

post "/logout" do
  session.clear
  redirect "/users"
end
