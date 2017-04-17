require 'rails_helper'

RSpec.describe Use, type: :model do
  it "is valid with name" do
    use = FactoryGirl.build(:use)
    expect(use).to be_valid
  end

  it "is invalid with name" do
    use = FactoryGirl.build(:invalid_use)
    expect(use).to be_invalid
  end
end
