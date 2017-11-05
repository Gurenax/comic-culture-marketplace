module ProfilesHelper
  # Setup method for form_with in #Profile _form.html.erb
  # def setup_profile(profile)
  #   # Create new instance of Address when Billing Address is not present
  #   profile.billing_address ||= Address.new
  #   # Create new instance of Address when Shipping Address is not present
  #   profile.shipping_address ||= Address.new
  #   profile
  # end

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
