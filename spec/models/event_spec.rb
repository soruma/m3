# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event do
  describe 'Validation' do
    it 'is valid with date_of_onset and name and remarks' do
      event = build(:event)
      expect(event).to be_valid
    end

    it 'is invalid with date_of_onset' do
      event = build(:event, date_of_onset: nil)
      event.valid?
      expect(event.errors[:date_of_onset]).to include(%(can't be blank))
    end

    it 'is invalid with name' do
      event = build(:event, name: nil)
      event.valid?
      expect(event.errors[:name]).to include(%(can't be blank))
    end
  end

  describe 'Scope' do
    describe '#time_series' do
      let!(:targets) do
        [
          create(:event, date_of_onset: Date.current),
          create(:event, date_of_onset: Date.current + 1.day)
        ]
      end

      it 'sort by date_of_onset asc' do
        expect(described_class.time_series).to eq(targets)
      end
    end
  end
end
