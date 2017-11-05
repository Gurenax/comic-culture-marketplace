# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  topic      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#

class Conversation < ApplicationRecord
  has_many :user_conversations
  has_many :messages, dependent: :destroy
  has_many :users, through: :user_conversations, dependent: :destroy

  # Check is user is already in the conversation
  def includes_user?(user)
    users.include?(user)
  end

  # Add a user to the conversation
  def add_user(user)
    users << user
    save
  end
end
