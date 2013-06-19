class PropertiesController < ApplicationController

  def root
    redirect_to properties_path and return
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
      redirect_to properties_path and return
    else
      render :edit and return
    end
  end

  def new
    @title = "Add property"
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
      redirect_to properties_path and return
    else
      render :new and return
    end
  end

  def destroy
    @property = Property.where(id: params["id"]).first
    @property.destroy
    redirect_to properties_path and return
  end

end
