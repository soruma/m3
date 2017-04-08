FactoryGirl.define do
  factory :use do
    name "MyString"
  end

  # 生活費
  factory :cost_of_living, class: Use do
    name "Cost of living"
  end
end
