App::Application.routes.draw do
  get "/"               => redirect("/login")
  get "/login"          => "car#enter_login"
  post "/login"         => "car#submit_login"
  get "/reservations"   => "car#current_reservation"
  post "/reservations"  => "car#make_reservations"
end
