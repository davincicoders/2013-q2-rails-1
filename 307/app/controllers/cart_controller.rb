class CartController < ApplicationController
  def root
    redirect_to "/credit_card" and return
  end
  def edit_credit_card
    @credit_card = CreditCard.new
    render :edit_credit_card and return
  end
end
