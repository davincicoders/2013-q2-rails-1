class Admin::PropertiesController < ApplicationController

  before_filter(except: ["login", "login_post", "logout"]) do
    if session[:property_admin_id] != nil
      @admin = PropertyAdmin.where(id: session[:property_admin_id]).first
    else
      flash[:error] = "You must be logged in to see that page."
      redirect_to login_path and return
    end
  end

  def login
    @title = "Login"
    render :login and return
  end

  def login_post
    username = params[:username]
    password = params[:password]
    admin = PropertyAdmin.where(username: username).first

    if admin == nil
      @title = "Login"
      flash.now[:error] = "Unknown username"
      render :login and return
    elsif password != admin.password
      @title = "Login"
      flash.now[:error] = "Wrong password"
      render :login and return
    else 
      session[:property_admin_id] = admin.id
      redirect_to admin_properties_path and return
    end
  end

  def index
    @title = "Properties"
    @properties = Property.order("id")
    render :index and return
  end

  def edit
    @title = "Edit property"
    @property = Property.where(id: params["id"]).first
    render :edit and return
  end

  def update
    @property = Property.find(params["id"])
    @property.address         = params["address"]
    @property.city            = params["city"]
    @property.state           = params["state"]
    @property.price           = params["price"]
    @property.num_bedrooms    = params["num_bedrooms"]
    @property.num_stories     = params["num_stories"]
    @property.num_square_feet = params["num_square_feet"]
    @property.image_url       = params["image_url"]

    if @property.save
      redirect_to admin_properties_path and return
    else
      render :edit and return
    end
  end

  def new
    @property = Property.new
    render :new and return
  end

  def create
    @property = Property.new
    @property.address         = params["address"]
    @property.city            = params["city"]
    @property.state           = params["state"]
    @property.price           = params["price"]
    @property.num_bedrooms    = params["num_bedrooms"]
    @property.num_stories     = params["num_stories"]
    @property.num_square_feet = params["num_square_feet"]
    @property.image_url       = params["image_url"]

    if @property.save
      redirect_to admin_properties_path and return
    else
      render :new and return
    end
  end

  def destroy
    @property = Property.where(id: params["id"]).first
    @property.destroy
    redirect_to admin_properties_path and return
  end

  def logout
    session.clear
    redirect_to admin_login_path and return
  end

end
