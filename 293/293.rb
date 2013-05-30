require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin
after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError

get "/"  do
  redirect "/plots"
end

get "/plots" do
  @plots = GardenPlot.all
  halt erb(:garden_plots)
end

post "/plots" do
  # TODO: if a garden plot was deleted, delete it
  if params["plot_id_to_delete"] !=nil
  plot = GardenPlot.where(id: params["plot_id_to_delete"]).first
  plot.destroy
  end
  redirect "/plots"
end

get "/plots/:plot_id" do
  # TODO: set @title to Create New Plot or Edit Plot, depending on plot_id
  # TODO: find @plot (based on plot_id, which could be new)
   if params["plot_id"] == "new"
    @plot = GardenPlot.new
    @title = "Create New Plot"
  else
    @plot = GardenPlot.where(id: params["plot_id"]).first
    @title = "Edit Plot"
  end
  halt erb(:edit)
end
  

post "/plots/:plot_id" do
  # TODO: find @plot (based on plot_id, which could be new)
  # TODO: set fields on @plot based on the form params
  # TODO: attempt to save, then either redirect or show the form with errors
    if params["plot_id"] == "new"
    @plot = GardenPlot.new
  else
    @plot = GardenPlot.where(id: params["plot_id"]).first
  end
  @plot.seed_type = params["seed_type"]
  @plot.planted_year = params["planted_year"]
  @plot.planted_month = params["planted_month"]
  @plot.planted_day = params["planted_day"]
  @plot.is_unused = (params["is_unused"] !=nil)
  @plot.save
  if @plot.save
    redirect "/plots"
  else
    halt erb(:edit)
  end
end


