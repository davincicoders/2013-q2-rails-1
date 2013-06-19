WebApp::Application.routes.draw do
  get  "/"                    => "real_estate#root"
  
  resources :real_estate, only: [:index, :show]

  namespace :admin do
    get "/login"              => "real_estate#login",                  as: "login"
    post "/login"             => "real_estate#login_post",             as: "login_post"
    post "/logout"            => "real_estate#logout",                 as: "logout"

    resources :real_estate, only: [:index, :edit, :update, :new, :create, :destroy]
  end 
end
