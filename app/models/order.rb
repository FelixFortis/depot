class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :pay_type

  PAYMENT_TYPES = [ "Cheque", "Credit card", "Purchase order" ]
end
