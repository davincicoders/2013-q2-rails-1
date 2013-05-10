require './connect_to_db.rb'

class Cat < ActiveRecord::Base
end

felix = Cat.where(name: "Felix").first
if felix
felix.destroy
end
# TODO: Felix has been given away to a friend, so delete the record for him.
# If there's no Felix record found, just do nothing; there shouldn't be an
# error.
