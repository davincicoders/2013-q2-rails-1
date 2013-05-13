require './connect_to_db.rb'

class Cat < ActiveRecord::Base
end

# TODO: Felix has been given away to a friend, so delete the record for him.
# If there's no Felix record found, just do nothing; there shouldn't be an
# error.

fluffy = Cat.where(name: "Fluffy").first

# if fluffy.nil?
# else
# fluffy.destroy
# end

if fluffy
	fluffy.destroy
end