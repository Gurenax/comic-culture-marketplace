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
      @profile = Profile.create!(user: @user, first_name: 'Glenn', last_name: 'Dimaliwat')
      @user2 = User.create!(email: 'john@example.com', password: 'password')
      @profile2 = Profile.new(user: @user2, first_name: '', last_name: 'Smith')
      @user3 = User.create!(email: 'sam@example.com', password: 'password')
      @profile3 = Profile.new(user: @user3, first_name: 'Sam', last_name: '')
    end

    it 'will create a record in the Profiles table' do
      expect(Profile.find(@profile.id).present?).to be_truthy
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
  end
end
