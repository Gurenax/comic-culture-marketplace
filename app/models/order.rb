# == Schema Information
#
# Table name: orders
#
#  id                :integer          not null, primary key
#  buyer_id          :integer
#  charge_identifier :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  has_many :order_items
  has_many :products, through: :order_items, dependent: :destroy

  # Add product to order
  def add_product(product)
    products << product
    # save
  end

  # Remove product from order
  def remove_product(product)
    products.delete(product)
    # save
  end

  # Access a product from order
  def product(product)
    products.find(product.id)
  end

  # Check if product already added in order
  def includes_product?(product)
    products.include?(product)
  end

end
