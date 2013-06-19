class PropertyAdmin < ActiveRecord::Base
  attr_accessible :username
  attr_accessible :password
end
