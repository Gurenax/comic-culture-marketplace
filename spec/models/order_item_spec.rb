# == Schema Information
#
# Table name: order_items
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  
  context 'when adding a product as a new order item' do
    before do
      @user = User.create!(email: 'glenn@example.com', password: 'password')
      @buyer = User.create!(email: 'sam@example.com', password: 'password')
      billing_address = Address.new(house_number: '7', street_name: 'Auburn')
      shipping_address = Address.new(house_number: '8', street_name: 'Auburn')
      Profile.create!(user: @user, first_name: 'Glenn', last_name: 'Blake', billing_address: billing_address, shipping_address: shipping_address)
      Profile.create!(user: @buyer, first_name: 'Sam', last_name: 'Blake', billing_address: billing_address, shipping_address: shipping_address)
      @product = Product.create!(seller: @user, name: 'Batman1', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @order = Order.create!(buyer: @buyer)
      @order.add_product(@product)
    end

    it 'will contain the product which was added' do
      expect(@order.includes_product?(@product)).to be true
    end

    it { should validate_uniqueness_of(:product_id).scoped_to(:order_id) }
  end

end
