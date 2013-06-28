class MainController < ApplicationController
  before_filter(except: [
    :login, :facebook_login_failure, :facebook_login, :logout
  ]) do
    @logged_in_user = User.where(id: session[:user_id]).first
    if @logged_in_user == nil
      redirect_to login_path and return
    end
  end

  def login
    render :login and return
  end

  def facebook_login
    auth = request.env['omniauth.auth']
    if auth && auth[:provider] == "facebook"
      existing_user = User.where(facebook_user_id: auth[:uid]).first
      if existing_user
        session[:user_id] = existing_user.id
      else
        new_user                    = User.new
        new_user.first_name         = auth[:info][:first_name]
        new_user.last_name          = auth[:info][:last_name]
        new_user.email              = auth[:info][:email]
        new_user.facebook_user_id   = auth[:uid]
        new_user.facebook_photo_url = auth[:info][:image]
        new_user.save!
        session[:user_id] = new_user.id
      end
      redirect_to "/" and return
    end
  end

  def users
    @users = User.order("id")
    render :users and return
  end

  def users_post
    if params[:delete_user_id] != nil
      user = User.find(params[:delete_user_id])
      user.destroy
    end
    redirect_to users_path
  end

  def logout
    session.clear
    redirect_to login_path
  end
end
