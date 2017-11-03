require 'rails_helper'

RSpec.describe "watchlists/edit", type: :view do
  before(:each) do
    @watchlist = assign(:watchlist, Watchlist.create!(
      :user => nil,
      :product => nil
    ))
  end

  it "renders the edit watchlist form" do
    render

    assert_select "form[action=?][method=?]", watchlist_path(@watchlist), "post" do

      assert_select "input[name=?]", "watchlist[user_id]"

      assert_select "input[name=?]", "watchlist[product_id]"
    end
  end
end
