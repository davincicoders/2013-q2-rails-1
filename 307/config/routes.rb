App::Application.routes.draw do
  get "/" => "cart#root"
  get "/credit_card" => "cart#edit_credit_card"
  post "/credit_card" => "cart#update"
  get "/thank_you" => "cart#thank_you"
end
