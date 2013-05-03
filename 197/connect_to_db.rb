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

# To do: add Active Record class definitions for all the tables you need.
# See computers_today_db.sql for what tables are available.
# See 198/connect_to_db.rb and 199/connect_to_db.rb for examples.
