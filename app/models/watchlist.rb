class Watchlist < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  has_many :products

  # Get Product data for Product id
  def product
    Product.find(product_id)
  end

  # Get Product data for Product id
  def product_price
    product.price
  end

  # Get Products status for Product id
  def product_status
    product.status
  end
end
