class CreateShoppingCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_items do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :shopping_cart, foreign_key: true

      t.timestamps
    end
  end
end
