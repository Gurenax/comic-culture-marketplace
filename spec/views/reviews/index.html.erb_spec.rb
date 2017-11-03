require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        :user => nil,
        :comment => "MyText",
        :rating => "9.99"
      ),
      Review.create!(
        :user => nil,
        :comment => "MyText",
        :rating => "9.99"
      )
    ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
