module ProfilesHelper
  def direct_message_topic_between(user1, user2)
    if user1.id < user2.id
      "Conversation between user #{user1.id} and user #{user2.id}"
    elsif user1.id > user2.id
      "Conversation between user #{user2.id} and user #{user1.id}"
    else
      "Conversation with self #{user1.id}"
    end
  end

  def conversation_title_between(user1, user2)
    if user1.id < user2.id
      "Conversation between #{user1.profile.first_name} and #{user2.profile.first_name}"
    elsif user1.id > user2.id
      "Conversation between #{user2.profile.first_name} and #{user1.profile.first_name}"
    else
      "Conversation with self"
    end
  end
end
