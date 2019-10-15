# frozen_string_literal: true

FactoryBot.define do
  factory :history do
    date_of_onset { '2017-03-05' }
    account
    price { '9.99' }

    trait :invalid do
      date_of_onset { nil }
      price { nil }
    end
  end

  factory :his_2017_01, class: History do
    date_of_onset { '2017-01-31' }
    association :account, factory: :wallet
    price { '999' }
  end

  factory :his_2017_02, class: History do
    date_of_onset { '2017-02-28' }
    association :account, factory: :cash_stash
    price { '100' }
  end

  factory :update_history, class: History do
    date_of_onset { '2017-03-06' }
    association :account, factory: :wallet
    price { '10.99' }
  end
end
