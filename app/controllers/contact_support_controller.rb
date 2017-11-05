class ContactSupportController < ApplicationController
  def new
    @error_messages = []
  end

  def create
    from_email = params[:email]
    message = params[:message]

    @error_messages = []
    @error_messages << 'Please enter your email' if from_email.blank?
    @error_messages << 'Please enter your message' if message.blank?
    
    # No errors, all good
    if @error_messages.empty?
        # Send the message to our support email address
        ContactSupportMailer.contact_support(from_email, message).deliver_now
        # Show success message
        render :success

    # There are errors
    else
        # Show the user the errors
        render :new

    end
  end
end
