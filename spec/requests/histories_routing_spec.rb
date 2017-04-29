require 'rails_helper'

RSpec.describe HistoriesController, type: :routing do
  describe "routing" do
    it "routes to histories#bunch" do
      expect(:post => "/histories/bunch").to route_to("histories#bunch")
    end

    it "routes to histories#import" do
      expect(:post => "/histories/import").to route_to("histories#import")
    end

    it "routes to histories#export" do
      expect(:post => "/histories/export").to route_to("histories#export")
    end
  end
end
