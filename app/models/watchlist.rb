# == Schema Information
#
# Table name: watchlists
#
#  id         :integer          not null, primary key
#  buyer_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Watchlist < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  has_many :watchlist_items
  has_many :products, through: :watchlist_items, dependent: :destroy

  # Get Product data for Product id
  # def product
  #   Product.find(product_id)
  # end

  # # Get Product data for Product id
  # def product_price
  #   product.price
  # end

  # # Get Products status for Product id
  # def product_status
  #   product.status
  # end
end
