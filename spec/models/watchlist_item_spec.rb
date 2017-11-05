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

require 'rails_helper'

RSpec.describe WatchlistItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
