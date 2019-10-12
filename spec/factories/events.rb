# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    date_of_onset { '2017-03-05' }
    sequence(:name) { |n| "event name#{n}" }
  end

  factory :invalid_event, class: Event do
    date_of_onset { nil }
    name { '' }
  end

  factory :update_event, class: Event do
    sequence(:name) { |n| "update use name#{n}" }
  end

  factory :overseas_trip, class: Event do
    name { 'Overseas trip' }
  end
end
