# :nodoc:
module ApplicationHelper
  # Search Location Default. If blank, default to Melbourne
  def search_location
    user_signed_in? ? current_user.profile.billing_address.public_address : 'Melbourne, VIC, Australia'
  end

  # Formatted style for background images
  def style_for_backgound_image(url)
    "background-image: url(#{url});"
  end

  # Shopping Cart Label with Count if items are in cart
  def shopping_cart_label
    if user_signed_in? && !current_user.shopping_cart.blank? && current_user.shopping_cart.products.count > 0
      ' Shopping Cart ('+current_user.shopping_cart.products.count.to_s+')'
    else
      ' Shopping Cart'
    end
  end

  # Determine the number of stars in a rating
  def star_rating(rating)
    stars = ''
    full_star = '<i class="fa fa-star" aria-hidden="true"></i>'
    half_star = '<i class="fa fa-star-half-o" aria-hidden="true"></i>'
    no_star = '<i class="fa fa-star-o" aria-hidden="true"></i>'
    return "#{no_star}#{no_star}#{no_star}#{no_star}#{no_star}".html_safe if rating.blank? || rating == 0

    whole_number = rating.to_i
    decimal = rating % 1
    remaining = (5 - rating).to_i
    whole_number.downto(1) do
      stars.concat(full_star)
    end
    if decimal >= 0.6
      stars.concat(full_star)
    elsif decimal > 0
      stars.concat(half_star)
    end
    remaining.downto(1) do
      stars.concat(no_star)
    end
    stars.html_safe
  end

  # Determine summary text for the rating
  def summary_rating(rating)
    if rating <= 5.0
      'Excellent'
    elsif rating <= 4.5
      'Very good'
    elsif rating <= 4.0
      'Good'
    elsif rating <= 3.5
      'Fair'
    elsif rating <= 3.0
      'Average'
    elsif rating <= 2.0
      'Poor'
    elsif rating <= 1.0
      'Very Poor'
    elsif rating == 0
      'Unrated'
    end
  end

  # Format amount from centts
  def format_amount_from_cents(amount)
    (amount / 100.0).round(2)
  end

  # Format weight to kg from g
  def format_grams_to_kg(weight)
    weight / 1000.0
  end
end