module ShoppingCartsHelper
  def format_amount_from_cents(amount)
    (amount / 100.0).round(2)
  end
end
