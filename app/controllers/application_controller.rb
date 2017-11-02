# :nodoc:
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def set_profile!
      redirect_to new_profile_path if user_signed_in? and current_user.profile.nil?
    end
end
