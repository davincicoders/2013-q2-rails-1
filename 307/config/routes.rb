App::Application.routes.draw do

  #get "/" do
  #  redirect "/credit_card"
  #end
get "/" => "cart#root"

  #get "/credit_card" do
   # @credit_card = CreditCard.new
    #halt erb(:credit_card)
  #end
get "/credit_card" => "cart#edit_credit_card"

  #post "/credit_card" do
   # @credit_card = CreditCard.new
    #@credit_card.card_type           = params[:card_type]
    #@credit_card.number              = params[:number]
    #@credit_card.verification_number = params[:verification_number]
    #@credit_card.expiration_month    = params[:expiration_month]
    #@credit_card.expiration_year     = params[:expiration_year]
  
    #if @credit_card.save
    #  redirect "/thank_you"
    #else
    #  halt erb(:credit_card)
    #end
  #end
post "/credit_card" => "cart#update_credit_card"
get  "/thank_you"     => "cart#thank_you"

end
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

