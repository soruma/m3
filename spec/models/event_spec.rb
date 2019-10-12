# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
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
end
