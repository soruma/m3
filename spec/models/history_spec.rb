# frozen_string_literal: true

require 'rails_helper'

RSpec.describe History, type: :model do
  it 'is valid with date_of_onset and account and price' do
    history = build(:history)
    expect(history).to be_valid
  end

  it 'is invalid with date_of_onset and account and price' do
    history = build(:invalid_history)
    expect(history).to be_invalid
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

      it 'sort by date_of_onset and account' do
        expect(described_class.account_book).to eq(targets)
      end
    end
  end
end
