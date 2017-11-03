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

require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do
  
  context 'when checking out products in shopping cart' do
  #   before do
  #     @user = User.create!(email: 'glenn@example.com', password: 'password')
  #     @user2 = User.create!(email: 'sam@example.com', password: 'password')
  #     @product1 = Product.new(seller: @user, name: 'Batman1', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
  #     @product2 = Product.new(seller: @user, name: 'Batman2', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
  #     @product3 = Product.new(seller: @user, name: 'Batman3', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
  #     @shopping_cart_item1 = ShoppingCart.create!(product_id: @product1.id, buyer: @user2)
  #     @shopping_cart_item2 = ShoppingCart.create!(product_id: @product2.id, buyer: @user2)
  #     @shopping_cart_item3 = ShoppingCart.create!(product_id: @product3.id, buyer: @user2)
  #     @shopping_cart = ShoppingCart.where(buyer: @user2)
  #     @order = Order.create!(buyer: @user2)
  #   end

  #   it 'will set the products to Sold' do
  #     # @shopping_cart.checkout_products
  #     @shopping_cart.each do |item|
  #       item.checkout_products(@order)
  #     end #(&:checkout_products(@order))
  #   end
  end
end
