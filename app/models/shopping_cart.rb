# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  buyer_id   :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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

  # Sets products in shopping cart to Sold and adds them as Order Item
  # scope :checkout_products, -> {
  # puts self  
  # self.each do |cart|
  # def checkout_products(order)
  #   product_id = cart.product.id
  #   product = Product.find(product_id)
  #   product.status = 'Sold'
  #   product.save!
  #   OrderItem.create!(order: order, product_id: product_id)
  #   destroy
  # end

  # Get Products status for Product id
  def product_status
    Product.find(product_id).status
  end

  def set_product_status(status)
    shopping_cart_item = Product.find(product_id)
    shopping_cart_item.status = status
    shopping_cart_item.save
  end
end
