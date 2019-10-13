# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes to the uses controller', type: :routing do
  describe 'routing' do
    it 'routes to uses#import' do
      expect(post: '/data_management/uses/import').to route_to('uses#import')
    end

    it 'routes to uses#export' do
      expect(get: '/data_management/uses/export').to route_to('uses#export')
    end
  end
end
