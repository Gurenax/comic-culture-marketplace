require 'rails_helper'

RSpec.describe "shopping_carts/show", type: :view do
  before(:each) do
    @shopping_cart = assign(:shopping_cart, ShoppingCart.create!(
      :user => nil,
      :product => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
