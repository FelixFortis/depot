# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id, product_price)
    current_item = line_items.find_by_product_id(product_id)
    current_price = Product.find(product_id).price if current_price.nil?
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id, price: current_price)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
