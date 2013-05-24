require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin

after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError

get "/" do
  redirect "/fruits"
end

get "/fruits" do
  @fruits = Fruit.order("id").all
  halt erb(:index)
end

post "/fruits" do
  if params["edit"]
    fruit_id = params["edit"]
    fruit = Fruit.where(id: fruit_id).first
    redirect "/fruit/#{fruit.name}"
  elsif params["delete"]
    fruit_id = params["delete"]
    fruit = Fruit.where(id: fruit_id).first
    fruit.destroy
    redirect "/fruits"
  elsif params["add_new"]
    redirect "/fruit/new"
  end
end

get "/fruit/:fruit_name" do
  if params["fruit_name"] == "new"
    @fruit = Fruit.new
  else
    @fruit = Fruit.where(name: params["fruit_name"]).first
  end
  halt erb(:edit)
end

post "/fruit/:fruit_name" do
  if params["fruit_name"] == "new"
    @fruit                = Fruit.new
    @fruit.name           = params["name"]
    @fruit.image_filename = params["image_filename"]
    @fruit.usd_per_lb     = params["usd_per_lb"]
    if @fruit.save
      redirect "/fruits"
    else
      halt erb(:edit)
    end 
  else
    @fruit                = Fruit.where(name: params["fruit_name"]).first
    @fruit.name           = params["name"]
    @fruit.image_filename = params["image_filename"]
    @fruit.usd_per_lb     = params["usd_per_lb"]
    if @fruit.save
      redirect "/fruits"
    else
      halt erb(:edit)
    end 
  end
end

