require 'sinatra'

get "/" do
  @title = "Home page"
  erb(:home)
end

get "/about_us" do
  @title = "About Us"
  erb(:about_us)
end

get "/contact_us" do
  @title = "Contact Us"
  erb(:contact_us)
end

get "/tutorials/ruby_tutorial" do
  @title = "Ruby Tutorial"
  erb(:ruby_tutorial)
end

get "/tutorials/java_tutorial" do
  @title = "JavaScript Tutorial"
<<<<<<< HEAD
  erb(:java_tutorial)
=======
  erb(:js_tutorial)
>>>>>>> 0ab4d19cefa2a4fda11c0dac7316b39f5a698c5c
end

