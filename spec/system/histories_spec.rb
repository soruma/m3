# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Histories', type: :system, js: true do
  before do
    create_list(:account, 3)
    use = create(:use, name: 'Usually use')
    create(:account, name: 'Wallet', use: use)
  end

  it 'Use appears when you select account' do
    visit new_history_path
    select 'Wallet', from: 'history[account_id]'
    sleep 1

    expect(find('#use_name').text).to eq 'Usually use'
  end
end
