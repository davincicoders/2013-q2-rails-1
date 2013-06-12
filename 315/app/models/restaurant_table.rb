class RestaurantTable < ActiveRecord::Base
  has_many :restaurant_orders
  attr_accessible :id, :number_of_chairs
end
