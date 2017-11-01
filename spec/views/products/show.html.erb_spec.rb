require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Manufacturer/)
    expect(rendered).to match(/Publisher/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Illustrator/)
    expect(rendered).to match(/Isbn 10/)
    expect(rendered).to match(/Isbn 13/)
    expect(rendered).to match(/Dimensions/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Keywords/)
  end
end
