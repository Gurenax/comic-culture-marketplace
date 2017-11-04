# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  seller_id    :integer
#  name         :string
#  price        :decimal(, )
#  description  :text
#  condition    :string
#  status       :string
#  category     :string
#  manufacturer :string
#  publisher    :string
#  publish_date :date
#  author       :string
#  illustrator  :string
#  isbn_10      :string
#  isbn_13      :string
#  dimensions   :string
#  weight       :decimal(, )
#  keywords     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  postage      :string
#

require 'rails_helper'

RSpec.describe Product, type: :model do

  context 'when creating a new Product' do
    before do
      @user = User.create!(email: 'glenn@example.com', password: 'password')
      @product1 = Product.new(seller: @user, name: 'Batman', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @product1.save
      @product2 = Product.new(seller: @user, name: 'Batman', price: 200, description: 'Test Product 2', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @product3 = Product.new(seller: @user, name: 'Spiderman', price: -10, description: 'Test Product 2', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @product4 = Product.new(seller: @user, name: 'Flash', price: 10, description: '', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @product5 = Product.new(seller: @user, name: 'Iron Man', price: 10, description: 'TEst Product', condition: '', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @product6 = Product.new(seller: @user, name: 'Captain America', price: 10, description: 'TEst Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: '', postage: 'None/Pickup Only')
      @product7 = Product.new(seller: @user, name: 'Captain America', price: 10, description: 'TEst Product', condition: 'Mint', category: '', status: 'Sold', postage: 'None/Pickup Only')
      @product8 = Product.new(name: 'Captain America', price: 10, description: 'TEst Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Sold', postage: 'None/Pickup Only')
      @product9 = Product.new(seller: @user, name: '', price: 10, description: 'TEst Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Sold', postage: 'None/Pickup Only')
      @product10 = Product.new(seller: @user, name: 'Starlord', price: 10, description: 'TEst Product', condition: 'Mmmint', category: 'Comic Books & Graphic Novels', status: 'Sold', postage: 'None/Pickup Only')
      @product11 = Product.new(seller: @user, name: 'Starlord', price: 10, description: 'TEst Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Avai', postage: 'None/Pickup Only')
      @product12 = Product.new(seller: @user, name: 'Starlord', price: 10, description: 'TEst Product', condition: 'Mint', category: 'Comic Con', status: 'Sold', postage: 'None/Pickup Only')
      @product13 = Product.new(seller: @user, name: 'Aquaman', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available')
      @product14 = Product.new(seller: @user, name: 'Aquaman', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'Non')
    end

    it 'will allow to save products when all required fields are filled up' do
      expect(@product1).to be_valid
    end

    it 'will not allow two products with the same seller and name' do
      expect { @product2.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'will not allow prices smaller than 0' do
      expect(@product3).to be_invalid
    end

    it 'will not allow empty product descriptions' do
      expect(@product4).to be_invalid
    end

    it 'will not allow empty product condition' do
      expect(@product5).to be_invalid
    end

    it 'will not allow empty product status' do
      expect(@product6).to be_invalid
    end

    it 'will not allow empty product category' do
      expect(@product7).to be_invalid
    end

    it 'will not allow empty seller id' do
      expect(@product8).to be_invalid
    end

    it 'will not allow empty product name' do
      expect(@product9).to be_invalid
    end

    it 'will only allow product conditions that are part of enum condition types' do
      expect(Product.condition_types.include?(@product10.condition)).to be false
    end

    it 'will only allow product statuses that are part of enum status types' do
      expect(Product.status_types.include?(@product11.status)).to be false
    end

    it 'will only allow product categories that are part of enum category types' do
      expect(Product.category_types.include?(@product12.category)).to be false
    end

    it 'will not allow empty product postage' do
      expect(@product13).to be_invalid
    end

    it 'will only allow product postages that are part of enum postage types' do
      expect(Product.postage_types.include?(@product14.postage)).to be false
    end
  end

  context 'when a user is viewing a product' do
    before do
      @user = User.create!(email: 'a@example.com', password: 'password')
      @user2 = User.create!(email: 'b@example.com', password: 'password')
      @user3 = User.create!(email: 'c@example.com', password: 'password')
      @user4 = User.create!(email: 'd@example.com', password: 'password')
      @product1 = Product.create!(seller: @user, name: 'Batman1', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
    end

    it 'will count 1 view per user' do
      @product1.toggle_viewed_by(@user)
      @product1.toggle_viewed_by(@user2)
      @product1.toggle_viewed_by(@user3)
      expect(@product1.view_count).to eq(3)
    end

    it 'will not count duplicate views' do
      @product1.toggle_viewed_by(@user)
      @product1.toggle_viewed_by(@user2)
      @product1.toggle_viewed_by(@user3)
      @product1.toggle_viewed_by(@user)
      @product1.toggle_viewed_by(@user4)
      expect(@product1.view_count).to eq(4)
    end
  end

  context 'when adding a product to shopping cart' do
    before do
      @user = User.create!(email: 'a@example.com', password: 'password')
      @product1 = Product.create!(seller: @user, name: 'Batman1', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @product2 = Product.create!(seller: @user, name: 'Batman2', price: 200, description: 'Test Product 2', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
    end

    it 'will show that the product is already added in the cart' do
      @shopping_cart = ShoppingCart.create!(product_id: @product1.id, buyer: @user)
      expect(@product1.added_to_cart?(@user)).to be true
    end

    it 'will show that the product is not in the cart' do
      expect(@product2.added_to_cart?(@user)).to be false
    end
  end

  context 'when adding a product to watchlist' do
    before do
      @user = User.create!(email: 'a@example.com', password: 'password')
      billing_address = Address.new(house_number: '7', street_name: 'Auburn')
      shipping_address = Address.new(house_number: '8', street_name: 'Auburn')
      Profile.create!(user: @user, first_name: 'Donald', last_name: 'Blake', billing_address: billing_address, shipping_address: shipping_address)
      @product1 = Product.create!(seller: @user, name: 'Batman1', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @product2 = Product.create!(seller: @user, name: 'Batman2', price: 200, description: 'Test Product 2', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
    end

    it 'will show that the product is already added in the watchlist' do
      @shopping_cart = Watchlist.create!(product_id: @product1.id, buyer: @user)
      expect(@product1.added_to_watchlist?(@user)).to be true
    end

    it 'will show that the product is not in the watchlist' do
      expect(@product2.added_to_watchlist?(@user)).to be false
    end
  end

  context 'when accessing the name of the seller' do
    before do
      @user = User.create!(email: 'a@example.com', password: 'password')
      billing_address = Address.new(house_number: '7', street_name: 'Auburn')
      shipping_address = Address.new(house_number: '8', street_name: 'Auburn')
      @profile = Profile.create!(user: @user, first_name: 'Donald', last_name: 'Blake', billing_address: billing_address, shipping_address: shipping_address)
      @product1 = Product.create!(seller: @user, name: 'Batman1', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
    end

    it 'will show the full name of the seller' do
      expect(@product1.seller_name).to eq(@profile.full_name)
    end
  end
end
