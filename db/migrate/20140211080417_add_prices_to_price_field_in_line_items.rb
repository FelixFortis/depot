class AddPricesToPriceFieldInLineItems < ActiveRecord::Migration
  def up
    LineItem.all.each do |item|
      item.update_attribute :price, item.product.price
    end
  end
  def down
    LineItem.all.each do |item|
      item.update_attribute :price, nil
    end
  end
end
