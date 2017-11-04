class ConversationsController < ApplicationController
  before_action :authenticate_user!

  # Shows a list of Conversations
  def index
    @conversations = Conversation.all
  end

  # Creates a new Conversation or Joins an existing Conversation
  def create
    # Get the topic
    topic = params[:topic]
    # Get the title
    title = params[:title]

    # Search for the topic in Conversation table
    @conversation = Conversation.where(topic: topic).first
    
    # If topic does not exists, create the topic
    if !@conversation
      @conversation = Conversation.new(topic: topic, title: title)
      @conversation.users << current_user
      @conversation.save

    # If topic exists, join the conversation
    else
      # @conversation = Conversation.find(conversation.id)

      # If user is not yet in conversation, add user to conversation
      unless current_user.has_joined?(@conversation)
        @conversation.users << current_user
        @conversation.save
      end
      
    end

    # Redirect to conversation show page
    redirect_to conversation_path(@conversation)
  end

  # Shows the conversation and its messages
  def show
    @conversation = Conversation.find(params[:id])

    # If user is not yet in conversation, add user to conversation
    unless current_user.has_joined?(@conversation)
      @conversation.users << current_user
      @conversation.save
    end

  end

  # Deletes a conversation and its messages
  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy

    # Redirect to index
    redirect_to conversations_path
  end

end
