WebApp::Application.routes.draw do
  get "/"  => "properties#root"

  resources :properties,
    only: [:index, :edit, :update, :new, :create, :destroy]
end
