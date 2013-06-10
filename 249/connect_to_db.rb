require 'active_record'
require 'logger'

#ActiveRecord::Base.logger = Logger.new(STDOUT)
#ActiveRecord::Base.logger.formatter = proc { |sev, time, prog, msg| "#{msg}\n" }
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

class Student < ActiveRecord::Base
  has_and_belongs_to_many :courses
    validates_presence_of :full_name
    validates_presence_of :student_number
    validates_uniqueness_of :student_number
end

class Course < ActiveRecord::Base
  has_and_belongs_to_many :students
end
