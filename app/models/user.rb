# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #,
         #:confirmable # Commented out confirmable for testing purposes
  has_one :profile, dependent: :destroy
  has_many :products, foreign_key: 'seller_id', dependent: :destroy
  has_many :product_views, foreign_key: 'buyer_id', dependent: :destroy
  has_one :shopping_cart, foreign_key: 'buyer_id', dependent: :destroy
  has_many :shopping_cart_items, through: :shopping_cart
  has_one :watchlist, foreign_key: 'buyer_id', dependent: :destroy
  has_many :watchlist_items, through: :watchlist
  has_many :user_conversations
  has_many :conversations, through: :user_conversations
  has_many :orders, foreign_key: 'buyer_id', dependent: :destroy
  has_many :order_items, through: :order
  has_many :reviews, foreign_key: 'seller_id', dependent: :destroy

  def has_joined?(conversation)
    conversations.where(id: conversation).exists?
  end

  # Get review ratings average
  def average_review_rating
    return 0 if reviews.blank?
    reviews.average(:rating)
  end

  # Top Customer Reviews (Limit to 5)
  def top_customer_reviews
    reviews.order(rating: :desc).limit(5)
  end

  # All user reviews
  def customer_reviews
    reviews.order(rating: :desc)
  end

  # Orders in Descending order by Created At
  def orders_descending
    orders.order(created_at: :desc)
  end

  # Products the user is selling
  def products_selling
    products.where(status: 'Available').order(created_at: :desc)
  end
end
