App::Application.routes.draw do
  #get "/" do
  #  redirect "/credit_card"
  #end
  
  get "/" => "cart#root"
  
  #get "/credit_card" do
  #  @credit_card = CreditCard.new
  #  halt erb(:credit_card)
  #end

  get "/credit_card" => "cart#edit_credit_card"

  #post "/credit_card" do
  #  @credit_card = CreditCard.new
  #  @credit_card.card_type           = params[:card_type]
  #  @credit_card.number              = params[:number]
  #  @credit_card.verification_number = params[:verification_number]
  #  @credit_card.expiration_month    = params[:expiration_month]
  #  @credit_card.expiration_year     = params[:expiration_year]
    
  #  if @credit_card.save
  #    redirect "/thank_you"
  #  else
  #    halt erb(:credit_card)
  #  end
  #end

  #get "/thank_you" do
  #  halt erb(:thank_you)
  #end
end
