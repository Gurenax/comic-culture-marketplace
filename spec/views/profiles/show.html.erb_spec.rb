require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user => nil,
      :first_name => "First Name",
      :last_name => "Last Name",
      :image_data => "Image Data",
      :short_bio => "MyText",
      :superpowers => "Superpowers",
      :favourites => "Favourites"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Image Data/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Superpowers/)
    expect(rendered).to match(/Favourites/)
  end
end
