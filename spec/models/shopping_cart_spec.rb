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
    before do
      @user = User.create!(email: 'glenn@example.com', password: 'password')
      @user2 = User.create!(email: 'sam@example.com', password: 'password')
      @product1 = Product.create!(seller: @user, name: 'Batman1', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @product2 = Product.create!(seller: @user, name: 'Batman2', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @product3 = Product.create!(seller: @user, name: 'Batman3', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @shopping_cart_item1 = ShoppingCart.create!(product_id: @product1.id, buyer: @user2)
      @shopping_cart_item2 = ShoppingCart.create!(product_id: @product2.id, buyer: @user2)
      @shopping_cart_item3 = ShoppingCart.create!(product_id: @product3.id, buyer: @user2)
    end

    it 'will contain the product' do
      expect(@shopping_cart_item1.product).to eq(@product1)
    end

    it 'will contain the product price' do
      expect(@shopping_cart_item1.product_price).to eq(@product1.price)
    end

    it 'will contain the product status' do
      expect(@shopping_cart_item1.product_status).to eq(@product1.status)
    end

    it 'will set the shopping cart item to Sold' do
      @shopping_cart_item1.change_product_status_to('Sold')
      expect(@shopping_cart_item1.product_status).to eq('Sold')
    end

    it 'will set the shopping cart item to Available' do
      @shopping_cart_item2.change_product_status_to('Available')
      expect(@shopping_cart_item2.product_status).to eq('Available')
    end

    it 'will set the shopping cart item to Checked Out' do
      @shopping_cart_item3.change_product_status_to('Checked Out')
      expect(@shopping_cart_item3.product_status).to eq('Checked Out')
    end
  end
end
