require 'rails_helper'

RSpec.describe "Watchlists", type: :request do
  describe "GET /watchlists" do
    it "works! (now write some real specs)" do
      get watchlists_path
      expect(response).to have_http_status(200)
    end
  end
end
