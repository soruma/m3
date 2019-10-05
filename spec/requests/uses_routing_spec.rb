# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsesController, type: :routing do
  describe "routing" do
    it "routes to uses#import" do
      expect(post: "/uses/import").to route_to("uses#import")
    end

    it "routes to uses#export" do
      expect(get: "/uses/export").to route_to("uses#export")
    end
  end
end
