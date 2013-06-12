class CarShareMember < ActiveRecord::Base
  has_many :cars
  has_secure_password
end
