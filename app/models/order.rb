class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  attr_accessible :address, :email, :name, :pay_type

  PAYMENT_TYPES = [ "Cheque", "Credit card", "Purchase order" ]

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
end
