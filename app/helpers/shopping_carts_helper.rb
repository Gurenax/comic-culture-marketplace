module ShoppingCartsHelper
  # Format amount from centts
  def format_amount_from_cents(amount)
    (amount / 100.0).round(2)
  end

  # Format weight to kg from g
  def format_grams_to_kg(weight)
    weight / 1000.0
  end
end
