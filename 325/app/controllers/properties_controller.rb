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
    @property.address         = params["property"]["address"]
    @property.city            = params["property"]["city"]
    @property.state           = params["property"]["state"]
    @property.price           = params["property"]["price"]
    @property.num_bedrooms    = params["property"]["num_bedrooms"]
    @property.num_stories     = params["property"]["num_stories"]
    @property.num_square_feet = params["property"]["num_square_feet"]
    @property.image_url       = params["property"]["image_url"]

    if @property.save
      redirect_to properties_path and return
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
    @property.address         = params["property"]["address"]
    @property.city            = params["property"]["city"]
    @property.state           = params["property"]["state"]
    @property.price           = params["property"]["price"]
    @property.num_bedrooms    = params["property"]["num_bedrooms"]
    @property.num_stories     = params["property"]["num_stories"]
    @property.num_square_feet = params["property"]["num_square_feet"]
    @property.image_url       = params["property"]["image_url"]

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
