# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  seller_id  :integer
#  buyer_id   :integer
#  comment    :text
#  rating     :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ApplicationRecord
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User'

  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
