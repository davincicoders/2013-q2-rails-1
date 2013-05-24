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

class G197Customer < ActiveRecord::Base
  has_many :g197_orders
end

class G197SalesRep < ActiveRecord::Base
  has_many :g197_orders
end

class G197Order < ActiveRecord::Base
  belongs_to :g197_sales_reps
  has_many :g197_order_items
  belongs_to :g197_customer
end

class G197OrderItem < ActiveRecord::Base
  belongs_to :g197_order
  belongs_to :g197_product
end

class G197Product < ActiveRecord::Base
  has_many :g197_order_items
end