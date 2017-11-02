# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  product_id :integer
#  image_data :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Photo, type: :model do
  context 'when creating a new photo' do
    before do
      @user = User.create!(email: 'glenn@example.com', password: 'password')
      @product = Product.create!(seller: @user, name: 'Batman', price: 100, description: 'Test Product', condition: 'Mint', category: 'Comic Books & Graphic Novels', status: 'Available', postage: 'None/Pickup Only')
      @photo1 = Photo.new(image_data: 'image.jpg')
      @photo2 = Photo.new(product: @product)
      @photo3 = Photo.new(product: @product, image_data: 'image.jpg')
    end

    it 'will not allow empty product id' do
      expect { @photo1.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
    
    it 'will not allow empty image' do
      expect { @photo2.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'will allow to save the photo if product and image are present' do
      expect(@photo3).to be_valid
    end
  end
end
