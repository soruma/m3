# frozen_string_literal: true

require 'rails_helper'

RSpec.describe History, type: :model do
  it_behaves_like 'to_csv'

  describe 'Validation' do
    it 'is valid with date_of_onset and account and price' do
      history = build(:history)
      expect(history).to be_valid
    end

    it 'is invalid without a date_of_onset' do
      history = build(:history, date_of_onset: nil)
      history.valid?
      expect(history.errors[:date_of_onset]).to include(%(can't be blank))
    end

    it 'is invalid without an account' do
      history = build(:history, account: nil)
      history.valid?
      expect(history.errors[:account]).to include(%(can't be blank))
    end

    it 'is invalid uniqueness date_of_onset and account' do
      account = create(:account)
      create(:history, date_of_onset: Date.current, account: account)

      history = build(:history, date_of_onset: Date.current, account: account)
      history.valid?
      expect(history.errors[:account]).to include('has already been taken')
    end

    it 'is invalid without a price' do
      history = build(:history, price: nil)
      history.valid?
      expect(history.errors[:price]).to include(%(can't be blank))
    end
  end

  describe 'Scopes' do
    describe '#account_book' do
      let!(:targets) do
        [
          create(:history, date_of_onset: Date.current, account: create(:account)),
          create(:history, date_of_onset: Date.current, account: create(:account)),
          create(:history, date_of_onset: Date.current + 1.month, account: create(:account)),
          create(:history, date_of_onset: Date.current + 1.month, account: create(:account))
        ]
      end

      it 'sort by date_of_onset and account asc' do
        expect(described_class.account_book).to eq(targets)
      end
    end

    describe '#referential' do
      before do
        account = create(:account)
        create(:history, date_of_onset: Date.current, account: account)
        create(:history, date_of_onset: Date.current + 1.month, account: account)
      end

      it 'eager loading of accounts table' do
        targets = described_class.referential
        expect(targets.first.association(:account).loaded?).to be_truthy
      end

      it 'eager loading of uses table' do
        targets = described_class.referential
        expect(targets.first.account.association(:use).loaded?).to be_truthy
      end
    end
  end
end
