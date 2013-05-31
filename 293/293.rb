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
	if params["delete"]
		plot_id = params["delete"]
		plot = GardenPlot.where(id: plot_id).first
		plot.destroy 
  end
end

get "/plots/:plot_id" do
  if params["plot_id"] == "new"
    @title = "Create new plot"
    @plot = GardenPlot.new
  else
    @title = "Edit plot"
    @plot = GardenPlot.where(id: params["plot_id"]).first
  end
  halt erb(:garden_plot)
end

post "/plots/:plot_id" do
  if params["plot_id"] == "new"
    @plot = GardenPlot.new
  else
    @plot = GardenPlot.where(id: params["plot_id"]).first
  end

  @plot.seed_type = params["seed_type"]
  @plot.planted_year = params["planted_year"]
  @plot.planted_month = params["planted_month"]
  @plot.planted_day = params["planted_day"]
  @plot.is_unused = params["is_unused"]

  if @plot.save
    redirect "/plots"
  else
    halt erb(:garden_plot)
  end
end
