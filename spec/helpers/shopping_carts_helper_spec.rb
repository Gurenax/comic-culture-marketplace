require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ShoppingCartsHelper. For example:
#
# describe ShoppingCartsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ShoppingCartsHelper, type: :helper do
  context 'when converting amount from cents' do
    it 'will convert 5000.00 to 50.00' do
      expect(format_amount_from_cents(5000.00)).to eq(50.00)
    end
  end
end
