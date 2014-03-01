FactoryGirl.define do
  factory :activity do
    sequence(:name) { |n| "Activity #{ n }" }
  end
end
