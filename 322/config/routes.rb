WebApp::Application.routes.draw do
  get "/"  => "properties#root"

  resources :properties, only: [:index, :show]

  namespace :admin do
    get  "/login"  => "properties#login",      as: "login"
    post "/login"  => "properties#login_post", as: "login_post"
    post "/logout" => "properties#logout",     as: "logout"

    resources :properties,
      only: [:index, :edit, :update, :new, :create, :destroy]
  end
end
