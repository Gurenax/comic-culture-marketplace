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
      @product = Product.create!(seller: @user, name: 'Batman1', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @order = Order.create!(buyer: @buyer)
      @order_item = OrderItem.create!(order: @order, product_id: @product.id)
    end

    it 'will retrieve the product' do
      expect(@order_item.product).to eq(@product)
    end


  end

end
