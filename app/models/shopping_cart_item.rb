# == Schema Information
#
# Table name: shopping_cart_items
#
#  id               :integer          not null, primary key
#  product_id       :integer
#  shopping_cart_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ShoppingCartItem < ApplicationRecord
  belongs_to :product
  belongs_to :shopping_cart
  validates_uniqueness_of :product_id #, scope: :shopping_cart_id
  validate :item_sold, if: :item_sold

  # Check product if product is already sold
  def item_sold
    errors.add(:product, "cannot be added to cart if they are already sold") if product.status == 'Sold'
  end
end
