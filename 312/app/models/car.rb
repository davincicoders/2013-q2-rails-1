class Car < ActiveRecord::Base
  belongs_to :car_share_member
  attr_accessible :color, :model, :car_share_member_id
end
