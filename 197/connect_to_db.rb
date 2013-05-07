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
  
  class G197OrderItem < ActiveRecord::Base
    belongs_to :g197_product
    belongs_to :g197_order
  end
  
  class G197Order < ActiveRecord::Base
    belongs_to :g197_customer
    belongs_to :g197_sales_rep
    has_many :g197_order_items
  end
  
  class G197Product< ActiveRecord::Base
    has_many :g197_order_items
  end
  
  class G197SalesRep < ActiveRecord::Base
    has_many :g197_orders
  end
  
# To do: add Active Record class definitions for all the tables you need.
# See computers_today_db.sql for what tables are available.
# See 198/connect_to_db.rb and 199/connect_to_db.rb for examples.