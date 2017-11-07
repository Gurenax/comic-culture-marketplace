class AddUniqueProductIdIndexToShoppingCartItem < ActiveRecord::Migration[5.1]
  def change
    remove_index :shopping_cart_items, :product_id
    add_index :shopping_cart_items, :product_id, unique: :true
  end
end
