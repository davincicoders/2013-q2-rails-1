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

class Student < ActiveRecord::Base
  has_and_belongs_to_many :courses
  validates_uniqueness_of :student_number
  validates_presence_of :student_number
  validates_presence_of :full_name
end

class Course < ActiveRecord::Base
  has_and_belongs_to_many :students
  validates_presence_of :name
  validates_presence_of :course_number
end
