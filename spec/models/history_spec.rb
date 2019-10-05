# frozen_string_literal: true

require 'rails_helper'

RSpec.describe History, type: :model do
  it 'is valid with date_of_onset and account and price' do
    history = FactoryGirl.build(:history)
    expect(history).to be_valid
  end

  it 'is invalid with date_of_onset and account and price' do
    history = FactoryGirl.build(:invalid_history)
    expect(history).to be_invalid
  end
end
