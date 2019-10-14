# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home' do
  describe 'GET /' do
    it 'returns http success' do
      get root_url
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET info' do
    it 'returns http success' do
      get info_url
      expect(response).to have_http_status(:success)
    end
  end
end
