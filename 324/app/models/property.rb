class Property < ActiveRecord::Base
  attr_accessible :address
  attr_accessible :city
  attr_accessible :state
  attr_accessible :price
  attr_accessible :num_bedrooms
  attr_accessible :num_stories
  attr_accessible :num_square_feet
  attr_accessible :image_url
  
  validates_presence_of :price
end
