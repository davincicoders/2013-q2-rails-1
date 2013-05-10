require "active_record"
require "pry"
require "logger"
require './connect_to_db.rb'

class Cat < ActiveRecord::Base
end

# TODO: Update Fluffy's location to show that she is now "on the sofa".
# TODO: Update Felix's location to show that he is now "under the bed".

Fluffy = Cat.where(name:"Fluffy").first
Fluffy.location = "on the sofa"
Fluffy.save

Felix = Cat.where(name: "Felix").first
Felix.location = "under the bed"
Felix.save
