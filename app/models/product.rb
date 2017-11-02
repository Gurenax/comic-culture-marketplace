# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  seller_id    :integer
#  name         :string
#  price        :decimal(, )
#  description  :text
#  condition    :string
#  status       :string
#  category     :string
#  manufacturer :string
#  publisher    :string
#  publish_date :date
#  author       :string
#  illustrator  :string
#  isbn_10      :string
#  isbn_13      :string
#  dimensions   :string
#  weight       :decimal(, )
#  keywords     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Product < ApplicationRecord
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos

  belongs_to :seller, class_name: 'User'

  enum category_types: ['Comic Books & Graphic Novels', 'Toys & Collectables', 'Costumes', 'Clothing & Apparel']
  enum condition_types: ['Brand New', 'Mint', 'Good', 'Fair', 'Poor']
  enum status_types: ['Available', 'Sold']
  enum postage_types: ['None/Pickup Only', 'By Weight']

  validates :seller_id, uniqueness: { scope: :name, message: 'Product name already exists' }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :condition, presence: true
  validates :status, presence: true
  validates :category, presence: true
  validates :name, presence: true
  validates :postage, presence: true
end
