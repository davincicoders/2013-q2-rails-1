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

class Actor < ActiveRecord::Base
  has_many :awards
  has_and_belongs_to_many :movies
end

class Movie < ActiveRecord::Base
  has_many :awards
  has_and_belongs_to_many :actors
end

class Award < ActiveRecord::Base
  belongs_to :movie
  belongs_to :actor
end
