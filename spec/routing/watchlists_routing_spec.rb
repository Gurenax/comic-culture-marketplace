require "rails_helper"

RSpec.describe WatchlistsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/watchlists").to route_to("watchlists#index")
    end

    it "routes to #new" do
      expect(:get => "/watchlists/new").to route_to("watchlists#new")
    end

    it "routes to #show" do
      expect(:get => "/watchlists/1").to route_to("watchlists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/watchlists/1/edit").to route_to("watchlists#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/watchlists").to route_to("watchlists#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/watchlists/1").to route_to("watchlists#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/watchlists/1").to route_to("watchlists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/watchlists/1").to route_to("watchlists#destroy", :id => "1")
    end

  end
end
