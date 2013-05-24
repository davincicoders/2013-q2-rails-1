require 'sinatra'
require './connect_to_db.rb'

get("/fruits") do
  @fruits = Fruit.all
  halt erb(:pick_a_fruit)
end

get("/fruit/:fruit_name") do
  fruit_name = params["fruit_name"]
  @fruit = Fruit.where(name: fruit_name).first

  if @fruit != nil
    halt erb(:a_fruit)
  else
    halt 404, "Fruit not found"
  end
end
