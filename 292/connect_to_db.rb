require 'active_record'

ActiveRecord::Base.establish_connection(
  host:     "localhost",
  adapter:  "postgresql",
  username: "postgres",
  password: "postgres",
  database: "postgres")

class Property < ActiveRecord::Base
	validates_presence_of :address
	validates_presence_of :price
	validates_presence_of :num_bedrooms
	validates_presence_of :image_url
end

class PropertyAdmin < ActiveRecord::Base
end