# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes to the home controller' do
  it 'routes / to the home#index action' do
    expect(get: '/').to route_to('home#index')
  end

  it 'routes /info to the home#info action' do
    expect(get: '/info').to route_to('home#info')
  end

  it 'routes /ja/info to the home#info action and locale to ja' do
    expect(get: '/ja/info').to route_to('home#info', locale: 'ja')
  end
end
