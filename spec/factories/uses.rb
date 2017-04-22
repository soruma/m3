FactoryGirl.define do
  factory :use do
    sequence(:name) {|n| "MyString#{n}"}
  end

  factory :invalid_use, class: Use do
    name ""
  end

  factory :update_use, class: Use do
    sequence(:name) {|n| "update MyString#{n}"}
  end

  # 生活費
  factory :cost_of_living, class: Use do
    name "Cost of living"
  end
end
