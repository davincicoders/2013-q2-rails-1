require 'active_record'
require 'logger'

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger.formatter = proc { |sev, time, prog, msg| "#{msg}\n" }
if ENV['DATABASE_URL'] # for Heroku
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
else # for local development
  ActiveRecord::Base.establish_connection(
    host:     "localhost",
    adapter:  "postgresql",
    username: "postgres",
    password: "postgres",
    database: "postgres")
end

class CreditCard < ActiveRecord::Base
  validates_presence_of :card_type
  validates_presence_of :number
  validates_presence_of :expiration_month
  validates_presence_of :expiration_year
  validates_presence_of :verification_number
end
