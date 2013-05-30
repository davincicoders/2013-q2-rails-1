require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'

register SinatraMore::MarkupPlugin
after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError

get "/"  do
  redirect "/plots"
end

get "/plots" do
  @plots = GardenPlot.order("id").all
  halt erb(:garden_plots)
end

post "/plots" do
  if params["edit"]
    plot = GardenPlot.where(id: params["edit"]).first
    redirect "/plot/#{plot.id}"
  elsif params["delete"]
    plot_id = params["delete"]
    plot = GardenPlot.where(id: plot_id).first
    plot.destroy
    redirect "/plots"
  elsif params["add_new"]
    redirect "/plot/new"
  end
end

get "/plot/:plot_id" do
  if params["plot_id"] == "new"
    @plot = GardenPlot.new
  else
    @plot = GardenPlot.where(id: params["plot_id"]).first
  end
    halt erb(:garden_plot)
end

post "/plot/:plot_id" do
  # TODO: find @plot (based on plot_id, which could be new)
  # TODO: set fields on @plot based on the form params
  # TODO: attempt to save, then either redirect or show the form with errors
  if params["plot_id"] == "new"
    @plot                = GardenPlot.new
    @plot.seed_type      = params["seed_type"]
    @plot.planted_year   = params["planted_year"]
    @plot.planted_month  = params["planted_month"]
    @plot.planted_day    = params["planted_day"]
    @plot.is_unused      = (params["is_unused"] != nil)
    @plot.save
    if @plot.save
      redirect "/plots"
    else
      halt(:garden_plot)
    end
  else
    @plot                = GardenPlot.where(id: params["plot_id"]).first
    @plot.seed_type      = params["seed_type"]
    @plot.planted_year   = params["planted_year"]
    @plot.planted_month  = params["planted_month"]
    @plot.planted_day    = params["planted_day"]
    @plot.is_unused      = (params["is_unused"] != nil)
    @plot.save
    if @plot.save
      redirect "/plots"
    else
      halt(:garden_plot)
    end
  end  
end
