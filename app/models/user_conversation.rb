# == Schema Information
#
# Table name: user_conversations
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  conversation_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class UserConversation < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates_uniqueness_of :user_id, scope: :conversation_id
end
