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

class SAUser < ActiveRecord::Base
  has_and_belongs_to_many :sa_forums
end
class SAForum < ActiveRecord::Base
  has_and_belongs_to_many :sa_users
  has_and_belongs_to_many :sa_threads
end
class SAThread < ActiveRecord::Base
  has_and_belongs_to_many :sa_forums
end
