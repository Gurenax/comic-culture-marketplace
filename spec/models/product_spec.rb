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
#

# enum category_types: ['Comic Books & Graphic Novels', 'Toys & Collectables', 'Costumes', 'Clothing & Apparel']
# enum condition_types: ['Brand New', 'Mint', 'Good', 'Fair', 'Poor']
# enum status_types: ['Available', 'Sold']

require 'rails_helper'

RSpec.describe Product, type: :model do
  # seller id and name should be unique
  # price should be greater than or equal 0
  # seller id should not be empty
  # name should not be empty
  # description should not be empty
  # condition should not be empty
  # status should not be empty
  # category should not be empty

  context 'when creating a new Product' do
    before do
      @user = User.create!(email: 'glenn@example.com', password: 'password')
      # @billing_address = Address.new(house_number: '7', street_name: 'Auburn')
      # @shipping_address = Address.new(house_number: '8', street_name: 'Auburn')
      # @profile = Profile.create!(user: @user, first_name: 'Glenn', last_name: 'Dimaliwat', billing_address: @billing_address, shipping_address: @shipping_address)

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

end
