class RestaurantOrder < ActiveRecord::Base
  validates_presence_of :party_size
  validates_presence_of :restaurant_table_id
  belongs_to :restaurant_table
  has_many :ordered_menu_items
  attr_accessible :party_size, :restaurant_table_id, :is_closed
end