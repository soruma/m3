require 'rails_helper'

RSpec.describe HomeController, type: :routing do
  describe "routing" do
    it "routes to home#index" do
      expect(:get => "/").to route_to("home#index")
    end

    it "routes to home#info" do
      expect(:get => "/info").to route_to("home#info")
    end

    it "routes to ja home#info" do
      expect(:get => "/ja/info").to route_to("home#info", locale: "ja")
    end
  end
end
