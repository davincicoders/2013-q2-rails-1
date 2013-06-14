class OrderedMenuItem < ActiveRecord::Base
  validates_presence_of :menu_item_id
  validates_presence_of :restaurant_order_id
  validates_presence_of :chair_number
  belongs_to :menu_item
  belongs_to :restaurant_order
  attr_accessible :restaurant_order_id, :menu_item_id, :chair_number
end