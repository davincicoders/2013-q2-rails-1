require 'active_record'

ActiveRecord::Base.establish_connection(
  host:     "localhost",
  adapter:  "postgresql",
  username: "postgres",
  password: "postgres",
  database: "postgres")

class Property < ActiveRecord::Base
end

