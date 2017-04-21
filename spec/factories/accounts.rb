FactoryGirl.define do
  factory :account do
    name "MyString"
    use
  end

  factory :invalid_account, class: Account do
    name ""
    use nil
  end

  factory :update_account, class: Account do
    name "update MyString"
    use
  end

  # 財布
  factory :wallet, class: Account do
    name "Wallet"
    association :use, factory: :cost_of_living
  end
end
