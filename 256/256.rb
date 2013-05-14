require 'sinatra'

get("/page1") do
  @page_number = 1
  halt erb(:page)
  puts "---------2"  
end

get("/page2") do
  @page_number = 2
  halt erb(:page)
  puts "---------3"
end

get("/users") do
  @entity_name = "Spirit of Art"
  halt erb(:new)
end
  
puts "---------4"
