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
#  weight       :decimal(, )      default(0.0)
#  keywords     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  postage      :string
#

class Product < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    # All Attributes Used by Algolia
    attribute :name, :keywords, :description, :seller_name, :manufacturer, :publisher, :author, :illustrator, :view_count, :latitude, :longitude, :status, :category

    # Search Index
    searchableAttributes ['name', 'keywords', 'unordered(description)', 'seller_name', 'unordered(manufacturer)', 'unordered(publisher)', 'unordered(author)', 'unordered(illustrator)']

    # Rank by Product View Count
    customRanking ['asc(view_count)']

    # Location Search by Radius
    geoloc :latitude, :longitude

    # Filters
    attributesForFaceting [:status, :manufacturer, :publisher, :category, :seller_name]
    # tags [:keywords]
  end

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos
  belongs_to :seller, class_name: 'User'
  has_many :product_views, dependent: :destroy
  has_many :shopping_carts, dependent: :destroy
  has_many :watchlists, dependent: :destroy
  has_many :orders, dependent: :destroy

  enum category_types: ['Comic Books & Graphic Novels', 'Toys & Collectibles', 'Costumes', 'Clothing & Apparel']
  enum condition_types: ['Brand New', 'Mint', 'Good', 'Fair', 'Poor']
  enum status_types: ['Available', 'Reserved', 'Sold']
  enum postage_types: ['None/Pickup Only', 'By Weight']

  validates :name, uniqueness: { scope: :seller_id }
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 999999.99 }
  validates :description, presence: true
  validates :condition, presence: true
  validates :status, presence: true
  validates :category, presence: true
  validates :name, presence: true
  validates :postage, presence: true
  validates :weight, numericality: { greater_than_or_equal_to: 0 }
  validates :isbn_10, length: {minimum: 10, maximum: 10}, allow_blank: true
  validates :isbn_13, length: {minimum: 10, maximum: 13}, allow_blank: true
  validates :name, length: {maximum: 50}
  
  # Full name of the Seller
  def seller_name
    seller.profile.full_name
  end

  # Location of the Seller
  def seller_location
    seller.profile.billing_address.public_address
  end

  # Seller's latitude
  def latitude
    seller.profile.billing_address.latitude
  end

  # Seller's longitude
  def longitude
    seller.profile.shipping_address.longitude
  end

  # Distance between the seller and buyer
  def distance_from_seller(buyer)
    seller_coordinates = "#{latitude}, #{longitude}"
    buyer_coordinates = "#{buyer.profile.billing_address.latitude}, #{buyer.profile.billing_address.longitude}"
    Geocoder::Calculations.distance_between(seller_coordinates, buyer_coordinates, :units => :km)
  end

  # When the buyer, views the Product
  def toggle_viewed_by(buyer)
    unless ProductView.find_by(product_id: self.id, buyer: buyer).present?
      ProductView.create(product_id: self.id, buyer: buyer)
    end
  end

  # Count the Product Views
  def view_count
    product_views.count
  end

  # Change status of product to
  def change_status_to(new_status)
    self.status = new_status
    save
  end

  # For development purposes, return all products back to the store
  def self.mass_recall
    ShoppingCart.destroy_all
    Product.update_all(status: 'Available')
  end

  scope :category, ->(category) {
    Product.where(category: category, status: 'Available').order(created_at: :desc)
  }
end
