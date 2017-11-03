require 'rails_helper'

RSpec.describe "watchlists/new", type: :view do
  before(:each) do
    assign(:watchlist, Watchlist.new(
      :user => nil,
      :product => nil
    ))
  end

  it "renders new watchlist form" do
    render

    assert_select "form[action=?][method=?]", watchlists_path, "post" do

      assert_select "input[name=?]", "watchlist[user_id]"

      assert_select "input[name=?]", "watchlist[product_id]"
    end
  end
end
