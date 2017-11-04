# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Conversation < ApplicationRecord
  has_many :user_conversations
  has_many :messages, dependent: :destroy
  has_many :users, through: :user_conversations, dependent: :destroy
  
  def includes_user?(user)
      users.where(id: user).exists?
  end
end
