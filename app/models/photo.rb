# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  product_id :integer
#  image_data :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ApplicationRecord
  include ImageUploader[:image]

  belongs_to :product

  validates :product, presence: true
  validates :image_data, presence: true
end
