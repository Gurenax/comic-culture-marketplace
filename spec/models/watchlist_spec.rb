require 'rails_helper'

RSpec.describe Watchlist, type: :model do
  
  context 'when adding products to the watchlist' do
    before do
      @user = User.create!(email: 'glenn@example.com', password: 'password')
      @user2 = User.create!(email: 'sam@example.com', password: 'password')
      @product1 = Product.create!(seller: @user, name: 'Batman1', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @product2 = Product.create!(seller: @user, name: 'Batman2', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @product3 = Product.create!(seller: @user, name: 'Batman3', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @watchlist_item1 = Watchlist.create!(product_id: @product1.id, buyer: @user2)
      @watchlist_item2 = Watchlist.create!(product_id: @product2.id, buyer: @user2)
      @watchlist_item3 = Watchlist.create!(product_id: @product3.id, buyer: @user2)
    end

    it 'will contain the product' do
      expect(@watchlist_item1.product).to eq(@product1)
    end

    it 'will contain the product price' do
      expect(@watchlist_item1.product.price).to eq(@product1.price)
    end

    it 'will contain the product status' do
      expect(@watchlist_item1.product.status).to eq(@product1.status)
    end
  end
end
