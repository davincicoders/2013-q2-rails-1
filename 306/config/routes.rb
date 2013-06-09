App::Application.routes.draw do
  get  "/"              => redirect("/credit_card")
  get  "/credit_card"   => "cart#edit_credit_card"
  post "/credit_card"   => "cart#update_credit_card"
  get  "/thank_you"     => "cart#thank_you"
end
