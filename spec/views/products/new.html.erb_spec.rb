require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :user => nil,
      :name => "MyString",
      :price => "9.99",
      :description => "MyText",
      :condition => 1,
      :status => 1,
      :category => 1,
      :manufacturer => "MyString",
      :publisher => "MyString",
      :author => "MyString",
      :illustrator => "MyString",
      :isbn_10 => "MyString",
      :isbn_13 => "MyString",
      :dimensions => "MyString",
      :weight => "9.99",
      :keywords => "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[user_id]"

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[price]"

      assert_select "textarea[name=?]", "product[description]"

      assert_select "input[name=?]", "product[condition]"

      assert_select "input[name=?]", "product[status]"

      assert_select "input[name=?]", "product[category]"

      assert_select "input[name=?]", "product[manufacturer]"

      assert_select "input[name=?]", "product[publisher]"

      assert_select "input[name=?]", "product[author]"

      assert_select "input[name=?]", "product[illustrator]"

      assert_select "input[name=?]", "product[isbn_10]"

      assert_select "input[name=?]", "product[isbn_13]"

      assert_select "input[name=?]", "product[dimensions]"

      assert_select "input[name=?]", "product[weight]"

      assert_select "input[name=?]", "product[keywords]"
    end
  end
end
