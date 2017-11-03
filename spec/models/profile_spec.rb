# == Schema Information
#
# Table name: profiles
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  first_name          :string
#  last_name           :string
#  image_data          :string
#  date_of_birth       :date
#  short_bio           :text
#  superpowers         :string
#  favourites          :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  billing_address_id  :integer
#  shipping_address_id :integer
#

require 'rails_helper'

RSpec.describe Profile, type: :model do
  context 'when creating a new profile' do
    before do
      @user = User.create!(email: 'glenn@example.com', password: 'password')
      billing_address = Address.new(house_number: '7', street_name: 'Auburn')
      shipping_address = Address.new(house_number: '8', street_name: 'Auburn')

      @profile = Profile.create!(user: @user, first_name: 'Glenn', last_name: 'Dimaliwat', billing_address: billing_address, shipping_address: shipping_address)
      
      user2 = User.create!(email: 'john@example.com', password: 'password')
      @profile2 = Profile.new(user: user2, first_name: '', last_name: 'Smith', billing_address: billing_address, shipping_address: shipping_address)
      user3 = User.create!(email: 'sam@example.com', password: 'password')
      @profile3 = Profile.new(user: user3, first_name: 'Sam', last_name: '', billing_address: billing_address, shipping_address: shipping_address)
      @profile4 = Profile.new(user: user3, first_name: 'Sam', last_name: '', shipping_address: shipping_address)
      @profile5 = Profile.new(user: user3, first_name: 'Sam', last_name: '', billing_address: billing_address)
    end

    it 'will create a record in the Profiles table' do
      expect(Profile.find(@profile.id).present?).to be true
    end

    it 'will link the Profile to its corresponding User' do
      expect(@profile.user).to eq(@user)
    end

    it 'will not allow a blank first name' do
      expect(@profile2).to be_invalid
    end

    it 'will not allow a blank last name' do
      expect(@profile3).to be_invalid
    end

    it 'will not allow an empty billing address' do
      expect(@profile4).to be_invalid
    end

    it 'will not allow an empty shipping address' do
      expect(@profile5).to be_invalid
    end
  end

  context 'when referring to a user profile' do
    before do
      user = User.create!(email: 'glenn@example.com', password: 'password')
      billing_address = Address.new(house_number: '7', street_name: 'Auburn')
      shipping_address = Address.new(house_number: '8', street_name: 'Auburn')
      first_name = 'Glenn'
      last_name = 'Dimaliwat'
      @full_name = "#{first_name} #{last_name}"
      @profile = Profile.create!(user: user, first_name: first_name, last_name: last_name, billing_address: billing_address, shipping_address: shipping_address)
    end

    it 'will get the full name' do
      expect(@profile.full_name).to eq(@full_name)
    end
  end
end
