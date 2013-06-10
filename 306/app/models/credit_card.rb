class CreditCard < ActiveRecord::Base
  validates_presence_of :card_type
  validates_presence_of :number
  validates_presence_of :expiration_month
  validates_presence_of :expiration_year
  validates_presence_of :verification_number
end
