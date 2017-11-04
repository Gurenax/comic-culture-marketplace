module ProductsHelper
  def product_inquiry_topic_about(product, buyer)
    "Conversation about product #{product.id} between user #{product.seller.id} and user #{buyer.id}"
  end

  def conversation_title_about(product, buyer)
    "Conversation about #{product.name} between #{product.seller.profile.first_name} and #{buyer.profile.first_name}"
  end
end
