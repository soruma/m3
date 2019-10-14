# frozen_string_literal: true

FactoryBot.define do
  factory :use do
    sequence(:name) { |n| "use name#{n}" }

    trait :invalid do
      name { '' }
    end
  end

  factory :usually_use, class: Use do
    name { 'Usually use' }
  end

  factory :saving, class: Use do
    name { 'Saving' }
  end

  factory :update_use, class: Use do
    sequence(:name) { |n| "update use name#{n}" }
  end
end
