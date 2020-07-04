# frozen_string_literal: true

require 'rails_helper'

feature 'Histories', js: true do
  background do
    create_list(:account, 3)
    use = create(:use, name: 'Usually use')
    create(:account, name: 'Wallet', use: use)
  end

  scenario 'Use appears when you select account' do
    visit new_history_path
    select 'Wallet', from: 'history[account_id]'

    expect(find('#use_name').text).to eq 'Usually use'
  end
end
