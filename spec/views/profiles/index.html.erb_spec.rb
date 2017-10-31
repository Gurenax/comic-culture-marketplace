require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :user => nil,
        :first_name => "First Name",
        :last_name => "Last Name",
        :image_data => "Image Data",
        :short_bio => "MyText",
        :superpowers => "Superpowers",
        :favourites => "Favourites"
      ),
      Profile.create!(
        :user => nil,
        :first_name => "First Name",
        :last_name => "Last Name",
        :image_data => "Image Data",
        :short_bio => "MyText",
        :superpowers => "Superpowers",
        :favourites => "Favourites"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Image Data".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Superpowers".to_s, :count => 2
    assert_select "tr>td", :text => "Favourites".to_s, :count => 2
  end
end
