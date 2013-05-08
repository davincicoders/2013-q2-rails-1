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

class User < ActiveRecord::Base
  belongs_to :users_forum
  has_many :users_forums
end

class UsersForums < ActiveRecord::Base
  belongs_to :user
  has_many :users
  belongs_to :forum
  has_many :forums
end

class Forums < ActiveRecord::Base
  belongs_to :users_forum
  has_many :users_forums
  belongs_to :forums_thread
  has_many :forums_threads
end
class ForumsThreads < ActiveRecord::Base
  belongs_to :forum
  has_many :forums
  belongs_to :thread
  has_many :threads
end
class Threads < ActiveRecord::Base
  belongs_to :forums_thread
  has_many :forums_threads
end
