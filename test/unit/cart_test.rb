# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CartTest < ActiveSupport::TestCase

  test "cart should create a new line item when adding a new product" do
    # set up cart with a product in
    cart = Cart.new
    cart.add_product(products(:coffee).id)
    cart.save
    assert_equal(1, cart.line_items.count)

    # add a new unique product to the cart
    cart.add_product(products(:ruby).id)
    cart.save
    assert_equal(2, cart.line_items.count)
  end

  test "cart should update existing line item quantity when adding an existing product" do
    # set up cart with a product in
    cart = Cart.new
    cart.add_product(products(:ruby).id)
    cart.save
    assert_equal(1, cart.line_items.count)

    # add an existing product to the cart
    cart.add_product(products(:ruby).id)
    cart.save
    assert_equal(1, cart.line_items.count)
    assert_equal(2, cart.line_items(:ruby).size)
  end
end
