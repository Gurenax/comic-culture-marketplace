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

class Address < ApplicationRecord
  has_one :profile

  # Get country name from country code
  def country_name
    country = ISO3166::Country[country_code].name
  end

  # Get full address while ignoring blank details
  def full_address
    address_array = []
    house_street = "#{house_number} #{street_name}".strip
    address_array << house_street unless house_street.blank?
    address_array << town_suburb unless town_suburb.blank?
    address_array << city unless city.blank?
    state_postal = "#{state} #{postal_code}".strip
    address_array << state_postal unless state_postal.blank?
    address_array << country_name unless country_name.blank?
    address_array.join(', ')
  end
end
