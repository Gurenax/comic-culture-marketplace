# == Schema Information
#
# Table name: shopping_cart_items
#
#  id               :integer          not null, primary key
#  product_id       :integer
#  shopping_cart_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe ShoppingCartItem, type: :model do
  context 'when adding a product to the shopping cart' do
    before do
      @user = User.create!(email: 'glenn@example.com', password: 'password')
      billing_address = Address.new(house_number: '7', street_name: 'Auburn')
      shipping_address = Address.new(house_number: '8', street_name: 'Auburn')
      Profile.create!(user: @user, first_name: 'Glenn', last_name: 'Blake', billing_address: billing_address, shipping_address: shipping_address)
      @product = Product.create!(seller: @user, name: 'Batman1', price: 100.24, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @shopping_cart = ShoppingCart.create!(buyer: @user)
      @shopping_cart.add_product(@product)
    end

    it { should validate_uniqueness_of(:product_id) }
  end
end
