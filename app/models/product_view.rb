class ProductView < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', dependent: :destroy
end