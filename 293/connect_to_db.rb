require 'active_record'
require 'logger'

#ActiveRecord::Base.logger = Logger.new(STDOUT)
#ActiveRecord::Base.logger.formatter = proc { |sev, time, prog, msg| "#{msg}\n" }
ActiveRecord::Base.establish_connection(
  host:     "localhost",
  adapter:  "postgresql",
  username: "postgres",
  password: "postgres",
  database: "postgres")

class GardenPlot < ActiveRecord::Base
  validates_presence_of :seed_type
  validates_presence_of :planted_year
  validates_presence_of :planted_month
  validates_presence_of :planted_day
end
