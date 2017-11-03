require 'rails_helper'

RSpec.describe "watchlists/index", type: :view do
  before(:each) do
    assign(:watchlists, [
      Watchlist.create!(
        :user => nil,
        :product => nil
      ),
      Watchlist.create!(
        :user => nil,
        :product => nil
      )
    ])
  end

  it "renders a list of watchlists" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
