class ShoppingCartItem < ApplicationRecord
  belongs_to :product
  belongs_to :shopping_cart

  validates_uniqueness_of :product_id, scope: :shopping_cart_id
end
