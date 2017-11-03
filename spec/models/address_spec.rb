# == Schema Information
#
# Table name: addresses
#
#  id           :integer          not null, primary key
#  house_number :string
#  street_name  :string
#  town_suburb  :string
#  city         :string
#  state        :string
#  postal_code  :string
#  country_code :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'when referring to an address' do
    before do
      @full_address = '7 Riverdale Rd, Hawthorn, Melbourne, VIC 3000, Australia'
      @country_name = 'Australia'
      @address = Address.create!(house_number: '7', street_name: 'Riverdale Rd', town_suburb: 'Hawthorn', city: 'Melbourne', state: 'VIC', postal_code: '3000', country_code: 'AU')
    end

    it 'will convert the country code to a country name' do
      address_country_name = @address.country_name
      expect(address_country_name).to eq(@country_name)
    end

    it 'will get the full address' do
      expect(@address.full_address).to eq(@full_address)
    end
  end
end
