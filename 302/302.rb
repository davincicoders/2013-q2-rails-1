require 'sinatra'
require 'sinatra_more/markup_plugin'
require './connect_to_db.rb'
require 'rack-flash'

register SinatraMore::MarkupPlugin
after { ActiveRecord::Base.connection.close } # fix ConnectionTimeoutError
use Rack::Session::Cookie, secret: SecureRandom.hex

use Rack::Flash, sweep: true

get "/"  do
  redirect "/plots"
end

get "/plots" do
  @plots = GardenPlot.all
  halt erb(:garden_plots)
end

post "/plots" do
  if params["plot_id_to_delete"] != nil
    plot = GardenPlot.where(id: params["plot_id_to_delete"]).first
    plot.destroy
    flash[:confirm] = "Deletion Confirmed!"
  end
  redirect "/plots"
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
    flash_type = :create
    flash_message = "Created new record!"
    @plot = GardenPlot.new
  else
    flash_type = :change
    flash_message = "Changed record!"
    @plot = GardenPlot.where(id: params["plot_id"]).first
  end

  @plot.seed_type = params["seed_type"]
  @plot.planted_year = params["planted_year"]
  @plot.planted_month = params["planted_month"]
  @plot.planted_day = params["planted_day"]
  @plot.is_unused = params["is_unused"]

  if @plot.save
    flash[flash_type] = flash_message
    redirect "/plots"
  else
    flash[:error] = "Could not save!"
    halt erb(:garden_plot)
  end
end
