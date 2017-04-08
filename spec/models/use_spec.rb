require 'rails_helper'

RSpec.describe Use, type: :model do
  it "is valid with name" do
    use = FactoryGirl.build(:use)
    expect(use).to be_valid
  end
end
