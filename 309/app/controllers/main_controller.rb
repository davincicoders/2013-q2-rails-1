class MainController < ApplicationController
  def root
    redirect_to "/login" and return
  end

  def login
    @user = CarShareMember.new
    render :login and return
  end

  def login_post
    # find a user with the username that the user posted from the form
    @user = CarShareMember.where(username: params["username"]).first

    # check if that user exists and their password is correct.
    if @user != nil && @user.authenticate(params["password"])
      # if so, save the user's ID to session and redirect to /reservations
      session[:car_share_member_id] = @user.id
      redirect_to "/reservations" and return
    else
      # if not, redirect to login page again with a flash message:
      #   "Unknown username or wrong password."
      flash[:error] = "Unknown username or wrong password."
      redirect_to "/login" and return
    end
  end

  def reservations
    # check if there's a user ID saved in the session
    if session[:car_share_member_id] != nil
      # If so, load a variable named @user, and show the reservations ERb.
      @user = CarShareMember.where(id: session[:car_share_member_id]).first
      @car = Car.where(car_share_member_id: @user.id).first
      render :reservations and return
    else
      # If not, redirect to the login page.
      redirect_to "/login" and return
    end
  end

  def reservations_post
    if params["logout"] != nil
      session.clear
      redirect_to "/login" and return
    elsif params["return_this_car"] != nil
      car = Car.where(car_share_member_id: session[:car_share_member_id]).first
      car.car_share_member_id = nil
      car.save!
      redirect_to "/reservations" and return
    elsif params["reserve_this_car"] != nil
      car = Car.where(id: params["reserve_this_car"]).first
      car.car_share_member_id = session[:car_share_member_id]
      car.save!
      redirect_to "/reservations" and return
    else
      render 500, "Unknown button pressed with name #{params}"
    end
  end
end
