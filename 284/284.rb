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
  book_id = params["delete"]
  book = Book.where(id: book_id).first
  book.destroy
  redirect "/books"
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
<<<<<<< HEAD
  
end

=======
  if params["book_id"] == "new"
    @book                = Book.new
    @book.authors        = params["authors"]
    @book.title          = params["title"]
    @book.condition      = params["condition"]
    @book.stars          = params["stars"]
    @book.is_loaned_out  = (params["is_loaned_out"] != nil)
    if @book.save
      redirect "/books"
    else
      halt erb(:edit)
    end 
  else
    @book                = Book.where(id: params["book_id"]).first
    @book.authors        = params["authors"]
    @book.title          = params["title"]
    @book.condition      = params["condition"]
    @book.stars          = params["stars"]
    @book.is_loaned_out  = (params["is_loaned_out"] != nil)
    if @book.save
      redirect "/books"
    else
      halt erb(:edit)
    end 
  end
end
>>>>>>> 4761ca03d493683f5303642b741129a714538b42
