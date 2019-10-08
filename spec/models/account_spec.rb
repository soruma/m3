# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'is valid with name and use' do
    account = build(:account)
    expect(account).to be_valid
  end

  it 'is invalid with name and use' do
    account = build(:invalid_account)
    expect(account).to be_invalid
  end
end
