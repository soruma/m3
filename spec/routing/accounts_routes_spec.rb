# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes to the accounts controller', type: :routing do
  describe 'routing' do
    it 'routes to accounts#import' do
      expect(post: '/data_management/accounts/import').to route_to('accounts#import')
    end

    it 'routes to accounts#export' do
      expect(get: '/data_management/accounts/export').to route_to('accounts#export')
    end
  end
end
