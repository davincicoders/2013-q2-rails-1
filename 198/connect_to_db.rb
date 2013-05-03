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

class G198Collectible < ActiveRecord::Base
  belongs_to :g198_category
  belongs_to :g198_episode
end

class G198Category < ActiveRecord::Base
  has_many :g198_collectibles
end

class G198Episode < ActiveRecord::Base
  has_many :g198_collectibles
end
