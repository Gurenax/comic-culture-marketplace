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

class Profile < ApplicationRecord
  include ImageUploader[:image]
  
  belongs_to :user

  belongs_to :billing_address, class_name: 'Address', foreign_key: 'billing_address_id', dependent: :destroy
  belongs_to :shipping_address, class_name: 'Address', foreign_key: 'shipping_address_id', dependent: :destroy
  accepts_nested_attributes_for :billing_address
  accepts_nested_attributes_for :shipping_address

  validates :first_name, presence: true
  validates :last_name, presence: true

  # Get Full Name
  def full_name
    full_name = []
    full_name << first_name unless first_name.blank?
    full_name << last_name unless last_name.blank?
    full_name.join(' ').strip
  end

  # Select Australia as Default Country Code
  def selected_country_code(address)
    address.country_code.blank? ? 'AU' : address.country_code
  end
end
