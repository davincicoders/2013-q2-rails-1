require "active_record"
require "pry"
require "logger"
require './connect_to_db.rb'

class Cat < ActiveRecord::Base
end

# TODO: Update Fluffy's location to show that she is now "on the sofa".
# TODO: Update Felix's location to show that he is now "under the bed".



name = Cat.where(name: "Fluffy").first
name.location = "on the sofa"
name.save

name = Cat.where(name: "Felix").first
name.location = "under the bed"
name.save
  