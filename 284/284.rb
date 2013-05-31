require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin

after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError

get "/" do
  redirect "/books"
end

get "/books" do
  @books = Book.order("id").all
  halt erb(:index)
end

post "/books" do
  # TODO: handle edit, delete, or add_new
end

get "/book/:book_id" do
  if params["book_id"] == "new"
    @book = Book.new
  else
    @book = Book.where(id: params["book_id"]).first
  end
  halt erb(:edit)
end

post "/book/:book_id" do
  
end

