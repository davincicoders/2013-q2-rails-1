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
    if @property.update_attributes(params["property"])
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
    @property = Property.new(params["property"])
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
