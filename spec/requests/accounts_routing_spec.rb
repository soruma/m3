# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountsController, type: :routing do
  describe "routing" do
    it "routes to accounts#import" do
      expect(post: "/accounts/import").to route_to("accounts#import")
    end

    it "routes to accounts#export" do
      expect(get: "/accounts/export").to route_to("accounts#export")
    end
  end
end
