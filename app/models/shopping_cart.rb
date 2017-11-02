class ShoppingCart < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  has_many :products
  
  # Get Product data for Product id
  def product
    Product.find(product_id)
  end

  # Get Product data for Product id
  def product_price
    Product.find(product_id).price
  end
end
