class Photo < ApplicationRecord
  include ImageUploader[:image]

  belongs_to :product

  validates :product, presence: true
  validates :image_data, presence: true
end
