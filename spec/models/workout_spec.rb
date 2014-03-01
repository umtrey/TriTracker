require 'spec_helper'

describe Workout do
  it "should require a user" do
    build(:workout, user: nil).should_not be_valid
  end

  it "should require an activity" do
    build(:workout, activity: nil).should_not be_valid
  end

  it "should require a workout date" do
    build(:workout, workout_on: nil).should_not be_valid
  end

  it "should ensure the duration of the workout is a positive integer" do
    build(:workout, minutes_elapsed:    0).should_not be_valid
    build(:workout, minutes_elapsed:  -10).should_not be_valid
    build(:workout, minutes_elapsed: 10.5).should_not be_valid
    build(:workout, minutes_elapsed:   10).should be_valid
  end

  it "should ensure the distance covered is a positive number" do
    build(:workout, units_completed:  0).should_not be_valid
    build(:workout, units_completed: -1).should_not be_valid
    build(:workout, units_completed:  5).should be_valid
  end

  it "should have either a duration or distance, or both" do
    build(:workout, units_completed: nil, minutes_elapsed: nil).should_not be_valid
    build(:workout, units_completed: 10, minutes_elapsed: nil).should be_valid
    build(:workout, units_completed: nil, minutes_elapsed: 10).should be_valid
  end

  it "should have a unit of measure if units completed is provided" do
    build(:workout, units_completed: nil, unit_of_measure: nil).should be_valid
    build(:workout, units_completed: 10, unit_of_measure: nil).should_not be_valid
  end
end
