App::Application.routes.draw do
  get "/" => "main#root"
  get "/login" => "main#login"
  post "/login" => "main#login_post"
  get "/reservations" => "main#reservations"
  post "/reservations" => "main#reservations_post"
end
