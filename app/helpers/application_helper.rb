# :nodoc:
module ApplicationHelper
  # Search Location Default. If blank, default to Melbourne
  def search_location
    user_signed_in? ? current_user.profile.billing_address.full_address : 'Melbourne, VIC, Australia'
  end

  # Formatted style for background images
  def style_for_backgound_image(url)
    "background-image: url(#{url});"
  end
end
