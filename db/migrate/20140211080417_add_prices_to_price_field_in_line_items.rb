class AddPricesToPriceFieldInLineItems < ActiveRecord::Migration
  def up
    LineItem.all.each do |item|
      prod = Product.find(item.product_id)
      item.price = prod.price
    end
  end
  def down
    LineItem.all.each do |item|
      item.price = nil
    end
  end
end
