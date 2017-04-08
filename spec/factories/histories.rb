FactoryGirl.define do
  factory :history do
    date_of_onset "2017-03-05"
    account
    price "9.99"
  end

  # 2017-01 月分
  factory :his_2017_01 do
    date_of_onset "2017-01-31"
    association :account, factory: :wallet
    price "999"
  end
end
