class OrderItem < ApplicationRecord
  belongs_to :order
  # has_many :products
  has_one :product

  # Get Product data for Product id
  def product
    Product.find(product_id)
  end
end
