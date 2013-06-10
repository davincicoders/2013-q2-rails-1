class CartController < ApplicationController
  def root
    redirect_to "/credit_card" and return
  end
  def edit_credit_card
    @credit_card = CreditCard.new
    render :edit_credit_card and return
  end
  def update
    @credit_card = CreditCard.new
    @credit_card.card_type           = params[:card_type]
    @credit_card.number              = params[:number]
    @credit_card.verification_number = params[:verification_number]
    @credit_card.expiration_month    = params[:expiration_month]
    @credit_card.expiration_year     = params[:expiration_year]
    
    if @credit_card.save
      redirect_to "/thank_you" and return
    else
      render :edit_credit_card and return
    end
  end
  def thank_you
    render :thank_you and return
  end
end
