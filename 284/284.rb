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
  if params["edit"]
    book = Book.where(id: params["edit"]).first
    redirect "/book/#{book.id}"
  elsif params["delete"]
    book_id = params["delete"]
    book = Book.where(id: book_id).first
    book.destroy
    redirect "/book"
  elsif params["add_new"]
    redirect "/book/new"
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
  if params["book.id"] == "new"
    new_book               = Book.new
    new_book.title         = params["title"]
    new_book.authors       = params["authors"]
    new_book.condition     = params["condition"]
    new_book.is_loaned_out = (params["is_loaned_out"] != nil)
    new_book.stars         = params["stars"]
    new_book.save!
    
    redirect "/books"
    
  else
    @book               = Book.where(id: params["book_id"]).first
    @book.title         = params["title"]
    @book.authors       = params["authors"]
    @book.condition     = params["condition"]
    @book.is_loaned_out = (params["is_loaned_out"] != nil)
    @book.stars         = params["stars"]
    if @book.save
      redirect "/books" 
    else
      halt erb(:edit)
    end
  end
end
