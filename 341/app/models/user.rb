class User < ActiveRecord::Base
  validates_uniqueness_of :facebook_user_id
  validates_uniqueness_of :email
end
