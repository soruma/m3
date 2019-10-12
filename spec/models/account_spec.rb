# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'Validation' do
    it 'is valid with name and use' do
      account = build(:account)
      expect(account).to be_valid
    end

    it 'is invalid with name' do
      history = build(:account, name: nil)
      history.valid?
      expect(history.errors[:name]).to include(%(can't be blank))
    end

    it 'is invalid with use' do
      history = build(:account, use: nil)
      history.valid?
      expect(history.errors[:use]).to include('must exist')
    end
  end
end
