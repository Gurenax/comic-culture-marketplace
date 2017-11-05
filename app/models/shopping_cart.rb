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
    save
  end

  # Remove product from shopping cart
  def remove_product(product)
    products.delete(product)
    save
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
    products.group(:seller_id).sum(:weight).each_value do |weight|
      total += (weight <= 500 ? 4.0 : 6.0)
    end
    (total * 100).to_i
  end

  # Get Product data for Product id
  # def product
  #   Product.find(product_id)
  # end

  # # Get Product data for Product id
  # def product_price
  #   product.price
  # end

  # # Get Products status for Product id
  # def product_status
  #   product.status
  # end

  # # Change status of product (shopping cart item)
  # def change_product_status_to(status)
  #   shopping_cart_item = Product.find(product_id)
  #   shopping_cart_item.status = status
  #   shopping_cart_item.save
  # end
  
  # # Get the product's seller id
  # def seller_id
  #   product.seller.id
  # end

  # def postage_price
  #   product_weight = product.weight.blank? ?  0 : product.weight
  #   number_of_items_from_same_seller = buyer.shopping_cart.map(&:seller_id).count(seller_id)

  #   if product_weight <= 500
  #     postage_price = 4.00
  #   else
  #     postage_price = 5.50
  #   end

  #   postage_price / number_of_items_from_same_seller
  # end

end