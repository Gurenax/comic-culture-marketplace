require 'rails_helper'

RSpec.describe "shopping_carts/index", type: :view do
  before(:each) do
    assign(:shopping_carts, [
      ShoppingCart.create!(
        :user => nil,
        :product => nil
      ),
      ShoppingCart.create!(
        :user => nil,
        :product => nil
      )
    ])
  end

  it "renders a list of shopping_carts" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
