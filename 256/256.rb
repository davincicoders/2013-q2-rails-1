require 'sinatra'
get("/page1") do
  @page_number = 1
  @first_name = "Jack"
  halt erb(:page)
end

get("/page2") do
  @page_number = 2
  halt erb(:page)
end
