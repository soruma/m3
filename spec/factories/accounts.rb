FactoryGirl.define do
  factory :account do
    name "MyString"
    use
  end

  # 財布
  factory :wallet, class: Account do
    name "Wallet"
    association :use, factory: :cost_of_living
  end
end
