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
  redirect "/plots"
end

get "/plots/:plot_id" do
  if params["plot_id"] == "new"
    @title = "Create New Plot"
    @plot = GardenPlot.new
  else
    @title = "Edit Plot"
    @plot = GardenPlot.where(id: params["plot_id"]).first
  end
  halt erb(:garden_plot)
end

post "/plots/:plot_id" do
  if params["plot_id"] == "new"
    @plot = GardenPlot.new
    @plot.seed_type = params["seed_type"]
    @plot.planted_year = params["planted_year"]
    @plot.planted_month = params["planted_month"]
    @plot.planted_day = params["planted_day"]
    @plot.is_unused = (params["is_unused"] != nil)
    if @plot.save
      redirect "/plots"
    else
      halt erb(:garden_plot)
    end
  else
    raise params.inspect
    @plot = GardenPlot.where(id: params["plot_id"]).first
    @plot.seed_type = params["seed_type"]
    @plot.planted_year = params["planted_year"]
    @plot.planted_month = params["planted_month"]
    @plot.planted_day = params["planted_day"]
    @plot.is_unused = (params["is_unused"] != nil)
    if @plot.save
      redirect "/plots"
    else
      halt erb(:garden_plot)
    end
  end
end
