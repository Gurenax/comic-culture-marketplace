# :nodoc:
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

  private
    def set_profile!
      redirect_to new_profile_path if user_signed_in? and current_user.profile.nil?
    end
end
