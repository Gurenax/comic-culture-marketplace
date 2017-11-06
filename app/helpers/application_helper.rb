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

  # Shopping Cart Label with Count if items are in cart
  def shopping_cart_label
    if user_signed_in? && current_user.shopping_cart.products.count > 0
      ' Shopping Cart ('+current_user.shopping_cart.products.count.to_s+')'
    else
      ' Shopping Cart'
    end
  end
end
