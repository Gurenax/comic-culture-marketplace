# == Schema Information
#
# Table name: watchlist_items
#
#  id           :integer          not null, primary key
#  product_id   :integer
#  watchlist_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class WatchlistItem < ApplicationRecord
  belongs_to :product
  belongs_to :watchlist

  validates_uniqueness_of :product_id, scope: :watchlist_id
end
