module ProductsHelper
  # Conversation Topic for Product Inquiry
  def product_inquiry_topic_about(product, buyer)
    "Inquiry about product #{product.id} between user #{product.seller.id} and user #{buyer.id}"
  end

  # Conversation Title for Product Inquiry
  def conversation_title_about(product, buyer)
    "Inquiry about #{product.name} between #{product.seller.profile.first_name} and #{buyer.profile.first_name}"
  end

  # Check if a product is added to the shopping cart
  def added_to_cart?(product)
    return false unless user_signed_in?
    return false if current_user.shopping_cart.blank?
    current_user.shopping_cart.includes_product?(product)
  end

  # Check if a product is added to the watchlist
  def added_to_watchlist?(product)
    return false unless user_signed_in?
    return false if current_user.watchlist.blank?
    current_user.watchlist.includes_product?(product)
  end

  # Check if a product is already sold
  def sold?(product)
    product.status == 'Sold'
  end

  # Check if a product is already checked out by someone
  def reserved?(product)
    product.status == 'Reserved'
  end

  # Get button text for Add to Cart
  def add_to_cart_text(product)
    reserved?(product) ? 'Reserved' : sold?(product) ? 'Sold' : added_to_cart?(product) ? 'Added to Cart' : 'Add to Cart'
  end

  # Check if Add to Cart button is disabled
  def disable_add_to_cart?(product)
    added_to_cart?(product) || sold?(product) || reserved?(product) || product.seller == current_user
  end
end
