require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :user => nil,
        :name => "Name",
        :price => "9.99",
        :description => "MyText",
        :condition => 2,
        :status => 3,
        :category => 4,
        :manufacturer => "Manufacturer",
        :publisher => "Publisher",
        :author => "Author",
        :illustrator => "Illustrator",
        :isbn_10 => "Isbn 10",
        :isbn_13 => "Isbn 13",
        :dimensions => "Dimensions",
        :weight => "9.99",
        :keywords => "Keywords"
      ),
      Product.create!(
        :user => nil,
        :name => "Name",
        :price => "9.99",
        :description => "MyText",
        :condition => 2,
        :status => 3,
        :category => 4,
        :manufacturer => "Manufacturer",
        :publisher => "Publisher",
        :author => "Author",
        :illustrator => "Illustrator",
        :isbn_10 => "Isbn 10",
        :isbn_13 => "Isbn 13",
        :dimensions => "Dimensions",
        :weight => "9.99",
        :keywords => "Keywords"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Manufacturer".to_s, :count => 2
    assert_select "tr>td", :text => "Publisher".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Illustrator".to_s, :count => 2
    assert_select "tr>td", :text => "Isbn 10".to_s, :count => 2
    assert_select "tr>td", :text => "Isbn 13".to_s, :count => 2
    assert_select "tr>td", :text => "Dimensions".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Keywords".to_s, :count => 2
  end
end
