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
raise HERE
  # TODO: set @title to Create New Plot or Edit Plot, depending on plot_id
  # TODO: find @plot (based on plot_id, which could be new)
  halt erb(:garden_plot)
end

post "/plots/:plot_id" do
  # TODO: find @plot (based on plot_id, which could be new)
  # TODO: set fields on @plot based on the form params
  # TODO: attempt to save, then either redirect or show the form with errors
end
