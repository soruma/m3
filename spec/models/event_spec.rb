require 'rails_helper'

RSpec.describe Event, type: :model do
  it "is valid with date_of_onset and name and remarks" do
    event = FactoryGirl.build(:event)
    expect(event).to be_valid
  end

  it "is invalid with date_of_onset and name and remarks" do
    event = FactoryGirl.build(:invalid_event)
    expect(event).to be_invalid
  end
end
