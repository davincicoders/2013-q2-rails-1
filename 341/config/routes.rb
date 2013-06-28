App::Application.routes.draw do
  get  "/"                       => "main#users",      as: "users"
  post "/"                       => "main#users_post", as: "users"
  get  "/login"                  => "main#login",      as: "login"
  post "/logout"                 => "main#logout",     as: "logout"
  get  "/auth/facebook/callback" => "main#facebook_login"
end
