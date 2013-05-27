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

class BankUser < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :username
  validates_presence_of :password
  has_many :bank_accounts
end

class BankAccount < ActiveRecord::Base
  belongs_to :bank_user
end
