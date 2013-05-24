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

class SushiDish < ActiveRecord::Base
  has_many :sushi_order_line_items
end

class SushiOrderLineItem < ActiveRecord::Base
  belongs_to :sushi_dish
  belongs_to :sushi_order
end

class SushiOrder < ActiveRecord::Base
  has_many :sushi_order_line_items
end
