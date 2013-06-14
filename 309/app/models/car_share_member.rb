class CarShareMember < ActiveRecord::Base
  has_many :cars
  has_secure_password
  attr_accessible :first_name, :username, :password_digest
end