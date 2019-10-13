# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Use, type: :model do
  it_behaves_like 'to_csv'

  describe 'Validation' do
    it 'is valid with name' do
      use = build(:use)
      expect(use).to be_valid
    end

    it 'is invalid with name' do
      use = build(:use, name: nil)
      use.valid?
      expect(use.errors[:name]).to include(%(can't be blank))
    end
  end

  describe 'Scopes' do
    describe '#referential' do
      before do
        create_list(:use, 2)
      end

      it 'eager loading of accounts table' do
        targets = described_class.referential
        expect(targets.first.association(:accounts).loaded?).to be_truthy
      end
    end
  end
end
