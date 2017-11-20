# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  buyer_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShoppingCart < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  has_many :shopping_cart_items
  has_many :products, through: :shopping_cart_items, dependent: :destroy

  # Add product to shopping cart
  def add_product(product)
    products << product
    # save
  end

  # Remove product from shopping cart
  def remove_product(product)
    products.delete(product)
    # save
  end

  # Access a product from cart
  def product(product)
    products.find(product.id)
  end

  # Check if product already added in cart
  def includes_product?(product)
    products.include?(product)
  end

  # Get total price of products in cart (in cents)
  def products_total_price
    (products.sum(:price) * 100).to_i
  end

  # Get total price of postage (in cents)
  def postage_total_price
    total = 0.0
    products.where(postage: 'By Weight').group(:seller_id).sum(:weight).each_value do |weight|
      total += (weight <= 500 ? 4.0 : 6.0)
    end
    (total * 100).to_i
  end
end