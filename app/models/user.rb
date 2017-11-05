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

  def has_joined?(conversation)
    conversations.where(id: conversation).exists?
  end
end
