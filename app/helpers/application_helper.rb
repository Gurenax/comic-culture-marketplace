# :nodoc:
module ApplicationHelper
  # Search Location Default. If blank, default to Melbourne
  def search_location
    user_signed_in? ? current_user.profile.billing_address.full_address : 'Melbourne, VIC, Australia'
  end
end
