class PropertiesController < ApplicationController

  def root
    redirect_to properties_path and return
  end

  def index
    @title = "Welcome to our site"
    @properties = Property.order("id")
    render :index and return
  end

  def show
    @property = Property.where(id: params["id"]).first
    @title = "#{@property.address}, #{@property.city}, CO"
    render :show and return
  end

end
