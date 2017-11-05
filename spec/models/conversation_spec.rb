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

require 'rails_helper'

RSpec.describe Conversation, type: :model do
  context 'when adding users to a conversation' do
    before do
      @user = User.create!(email: 'glenn@example.com', password: 'password')
      @conversation = Conversation.create!(topic: 'Test')
    end

    it 'will contain the user' do
      @conversation.add_user(@user)
      expect(@conversation.includes_user?(@user)).to be true
    end
  end
end
