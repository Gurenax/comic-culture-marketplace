# == Schema Information
#
# Table name: order_items
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderItem < ApplicationRecord
  # belongs_to :order
  # has_one :product

  # # Get Product data for Product id
  # def product
  #   Product.find(product_id)
  # end

  belongs_to :product
  belongs_to :order

  validates_uniqueness_of :product_id, scope: :order_id
end
