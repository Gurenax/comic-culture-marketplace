class RemoveProductIdFromShoppingCart < ActiveRecord::Migration[5.1]
  def change
    remove_column :shopping_carts, :product_id
  end
end
