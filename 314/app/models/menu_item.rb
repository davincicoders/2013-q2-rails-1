class MenuItem < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :price
  has_many :ordered_menu_items
  attr_accessible :name, :price
end



