require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

use Rack::Session::Cookie, secret: SecureRandom.hex
after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError
register SinatraMore::MarkupPlugin

get "/" do
  redirect "/credit_card"
end

get "/credit_card" do
  @credit_card = CreditCard.new
  halt erb(:credit_card)
end

post "/credit_card" do
  @credit_card = CreditCard.new
  @credit_card.card_type           = params[:card_type]
  @credit_card.number              = params[:number]
  @credit_card.verification_number = params[:verification_number]
  @credit_card.expiration_month    = params[:expiration_month]
  @credit_card.expiration_year     = params[:expiration_year]
  
  if @credit_card.save
    redirect "/thank_you"
  else
    halt erb(:credit_card)
  end
end

get "/thank_you" do
  halt erb(:thank_you)
end
