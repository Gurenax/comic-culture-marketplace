module ProductsHelper
  def product_inquiry_topic_about(product, buyer)
    "Conversation about product #{product.id} between user #{product.seller.id} and user #{buyer.id}"
  end

  def conversation_title_about(product, buyer)
    "Conversation about #{product.name} between #{product.seller.profile.first_name} and #{buyer.profile.first_name}"
  end

  def added_to_cart?(product)
    return false unless user_signed_in?
    return false if current_user.shopping_cart.blank?
    current_user.shopping_cart.includes_product?(product)
  end

  def added_to_watchlist?(product)
    return false unless user_signed_in?
    return false if current_user.watchlist.blank?
    current_user.watchlist.includes_product?(product)
  end
end
