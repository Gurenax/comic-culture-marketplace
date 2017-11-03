# == Schema Information
#
# Table name: orders
#
#  id                :integer          not null, primary key
#  buyer_id          :integer
#  charge_identifier :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  has_many :order_items
end
