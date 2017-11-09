require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ProductsHelper. For example:
#
# describe ProductsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ProductsHelper, type: :helper do
  context 'when creating a new conversation about a product' do
    before do
      @seller = User.create!(email: 'a@example.com', password: 'password')
      @buyer = User.create!(email: 'b@example.com', password: 'password')
      billing_address = Address.new(house_number: '7', street_name: 'Auburn')
      shipping_address = Address.new(house_number: '8', street_name: 'Auburn')
      @seller_profile = Profile.create!(user: @seller, first_name: 'Donald', last_name: 'Blake', billing_address: billing_address, shipping_address: shipping_address)
      @buyer_profile = Profile.create!(user: @buyer, first_name: 'Jane', last_name: 'Foster', billing_address: billing_address, shipping_address: shipping_address)
      @product = Product.create!(seller: @seller, name: 'Batman1', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
    end

    it 'will show the topic correctly about the product' do
      topic = product_inquiry_topic_about(@product, @buyer)
      expect(topic).to eq("Inquiry about product #{@product.id} between user #{@seller.id} and user #{@buyer.id}")
    end

    it 'will show the correct conversation title' do
      topic = product_inquiry_topic_about(@product, @buyer)
      title = conversation_title_about(@product, @buyer)
      expect(title).to eq("Inquiry about #{@product.name} between #{@seller.profile.first_name} and #{@buyer.profile.first_name}")
    end
  end
end
