# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    date_of_onset { '2017-03-05' }
    sequence(:name) { |n| "event name#{n}" }

    trait :invalid do
      date_of_onset { nil }
      name { '' }
    end
  end

  factory :new_years_day, class: Event do
    date_of_onset { '2019-01-01' }
    name { %(New Year's Day) }
  end

  factory :christmas_day, class: Event do
    date_of_onset { '2019-12-25' }
    name { 'Christmas Day' }
  end

  factory :update_event, class: Event do
    sequence(:name) { |n| "update use name#{n}" }
  end

  factory :overseas_trip, class: Event do
    name { 'Overseas trip' }
  end
end
