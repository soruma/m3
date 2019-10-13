# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes to the histories controller', type: :routing do
  describe 'routing' do
    it 'routes to histories#import' do
      expect(post: '/data_management/histories/import').to route_to('histories#import')
    end

    it 'routes to histories#export' do
      expect(get: '/data_management/histories/export').to route_to('histories#export')
    end
  end
end
