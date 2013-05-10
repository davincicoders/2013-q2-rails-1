require "active_record"
require "pry"
require "logger"
require './connect_to_db.rb'

class Cat < ActiveRecord::Base
end

# TODO: Update Fluffy's location to show that she is now "on the sofa".
# TODO: Update Felix's location to show that he is now "under the bed".
fluffy = Cat.where(name: "Fluffy").first
fluffy.location = "on the sofa"
fluffy.save

felix = Cat.where(name: "Felix").first
felix.location = "under the bed"
felix.save
