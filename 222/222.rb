require './connect_to_db.rb'

class Cat < ActiveRecord::Base
end

# TODO: Felix has been given away to a friend, so delete the record for him.
# If there's no Felix record found, just do nothing; there shouldn't be an
# error.

if Cat.where(name: "Felix").count > 0
  cat_given_away = Cat.where(name: "Felix").first
  cat_given_away.destroy
else
end
  