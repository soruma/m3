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

  describe 'Scope' do
    describe '#referential' do
      before do
        use = create(:use)
        create_list(:account, 2, use: use)
      end

      it 'eager loading of uses table' do
        targets = described_class.referential
        expect(targets.first.association(:use).loaded?).to be_truthy
      end
    end
  end
end
