# == Schema Information
#
# Table name: product_views
#
#  id         :integer          not null, primary key
#  product_id :integer
#  buyer_id   :integer
#

class ProductView < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
end
