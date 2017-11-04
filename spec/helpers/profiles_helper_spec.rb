require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ProfilesHelper. For example:
#
# describe ProfilesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ProfilesHelper, type: :helper do
  context 'when creating a conversation from a profile page' do
    before do
      @user1 = User.create!(email: 'user1@example.com', password: '123456')
      @user2 = User.create!(email: 'user2@example.com', password: '123456')
      @profile1 = Profile.create(user: @user1, first_name: 'Donald', last_name: 'Blake')
      @profile2 = Profile.create(user: @user2, first_name: 'Jane', last_name: 'Foster')
    end

    it 'will show the conversation topic between users correctly' do
      topic = direct_message_topic_between(@profile1.user, @profile2.user)
      expect(topic).to eq("Conversation between user #{@user1.id} and user #{@user2.id}")
    end

    it 'will show the topic for conversations sent to self correctly' do
      topic = direct_message_topic_between(@profile1.user, @profile1.user)
      expect(topic).to eq("Conversation with self #{@user1.id}")
    end

    it 'will show the correct conversation title' do
      title = conversation_title_between(@profile1.user, @profile2.user)
      expect(title).to eq("Conversation between #{@profile1.first_name} and #{@profile2.first_name}")
    end
  end
end
