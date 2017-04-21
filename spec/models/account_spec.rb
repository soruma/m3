require 'rails_helper'

RSpec.describe Account, type: :model do
  it "is valid with name and use" do
    account = FactoryGirl.build(:account)
    expect(account).to be_valid
  end

  it "is invalid with name and use" do
    account = FactoryGirl.build(:invalid_account)
    expect(account).to be_invalid
  end
end
