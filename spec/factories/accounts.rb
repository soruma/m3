# frozen_string_literal: true

FactoryGirl.define do
  factory :account do
    sequence(:name) { |n| "account name#{n}" }
    use
  end

  factory :invalid_account, class: Account do
    name ''
  end

  factory :update_account, class: Account do
    sequence(:name) { |n| "update account name#{n}" }
    association :use, factory: :cost_of_living
  end

  # 財布
  factory :wallet, class: Account do
    name 'Wallet'
    association :use, factory: :cost_of_living
  end
end
