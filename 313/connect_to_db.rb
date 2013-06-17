require 'active_record'
require 'logger'

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger.formatter = proc { |sev, time, prog, msg| "#{msg}\n" }
if ENV['DATABASE_URL']
  db = URI.parse(ENV['DATABASE_URL'])
  ActiveRecord::Base.establish_connection({
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :port     => db.port,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8',
  })
else
  ActiveRecord::Base.establish_connection(
    host:     "localhost",
    adapter:  "postgresql",
    username: "postgres",
    password: "postgres",
    database: "postgres")
end

class RestaurantTable < ActiveRecord::Base 
  has_many :restaurant_orders   
end

class MenuItem < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :price
  has_many :ordered_menu_items
end

class RestaurantOrder < ActiveRecord::Base
  validates_presence_of :party_size
  validates_presence_of :restaurant_table_id
  belongs_to :restaurant_table
  has_many :ordered_menu_items
end

class OrderedMenuItem < ActiveRecord::Base
  validates_presence_of :menu_item_id
  validates_presence_of :restaurant_order_id
  validates_presence_of :chair_number
  belongs_to :menu_item
  belongs_to :restaurant_order
end
