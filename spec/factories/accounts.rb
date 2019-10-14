# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    sequence(:name) { |n| "account name#{n}" }
    use

    trait :invalid do
      name { '' }
    end
  end

  factory :wallet, class: Account do
    name { 'Wallet' }
    association :use, factory: :usually_use
  end

  factory :cash_stash, class: Account do
    name { 'Cash stash' }
    association :use, factory: :saving
  end

  factory :update_account, class: Account do
    sequence(:name) { |n| "update account name#{n}" }
    association :use, factory: :cost_of_living
  end
end
