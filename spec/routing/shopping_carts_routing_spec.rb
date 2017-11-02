require "rails_helper"

RSpec.describe ShoppingCartsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/shopping_carts").to route_to("shopping_carts#index")
    end

    it "routes to #new" do
      expect(:get => "/shopping_carts/new").to route_to("shopping_carts#new")
    end

    it "routes to #show" do
      expect(:get => "/shopping_carts/1").to route_to("shopping_carts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shopping_carts/1/edit").to route_to("shopping_carts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shopping_carts").to route_to("shopping_carts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/shopping_carts/1").to route_to("shopping_carts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/shopping_carts/1").to route_to("shopping_carts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shopping_carts/1").to route_to("shopping_carts#destroy", :id => "1")
    end

  end
end
