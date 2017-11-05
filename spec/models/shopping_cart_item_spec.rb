# == Schema Information
#
# Table name: shopping_cart_items
#
#  id               :integer          not null, primary key
#  product_id       :integer
#  shopping_cart_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe ShoppingCartItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
