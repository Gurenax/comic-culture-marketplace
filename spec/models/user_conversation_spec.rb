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

require 'rails_helper'

RSpec.describe UserConversation, type: :model do
  context 'when adding a new user to a conversation' do
    before do
      @user = User.create!(email: 'glenn@example.com', password: 'password')
      @conversation = Conversation.create!(topic: 'Test')
      @conversation.users << @user
    end

    it { should validate_uniqueness_of(:user_id).scoped_to(:conversation_id) }
  end
end
