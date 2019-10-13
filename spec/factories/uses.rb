# frozen_string_literal: true

FactoryBot.define do
  factory :use do
    sequence(:name) { |n| "use name#{n}" }

    trait :invalid do
      name { '' }
    end
  end

  factory :update_use, class: Use do
    sequence(:name) { |n| "update use name#{n}" }
  end

  factory :cost_of_living, class: Use do
    name { 'Cost of living' }
  end
end
