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
  if params["edit"]
  	book_id = params["edit"]
  	book = Book.where(id: book_id).first
  	redirect "/book/#{book.id}"
  
  elsif params["delete"]

  elsif params["add_new"]
  
  end
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
  # TODO: handle create or update
  new_book = Book.new
  new_book.authors = params["authors"]
  new_book.title = params["title"]
  new_book.stars = params["stars"]
  new_book.is_loaned_out = (params["is_loaned_out"] = !nil)
  new_book.condition = params["condition"]
  new_book.save!
  
  redirect "/books"
end

