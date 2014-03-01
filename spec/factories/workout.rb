FactoryGirl.define do
  factory :workout do
    user
    activity
    workout_on Date.today
    minutes_elapsed 10
    units_completed 5
    unit_of_measure "mi"
  end
end
