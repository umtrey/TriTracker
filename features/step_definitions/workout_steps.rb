Given /^I have (\d+) workout(s?)$/ do |count, plural|
  count.to_i.times { FactoryGirl.create(:workout, user: @user) }
end

When /^I click on "(.*?)"$/ do |link|
  click_link link
end

When /^I go to \"\/workouts\"$/ do
  visit '/workouts'
end

When /^I go to \"\/workouts\/new\"$/ do
  visit '/workouts/new'
end

When /^I fill in the workouts form$/ do
  select Activity.first.name, from: "workout_activity_id"
  fill_in "workout_workout_on", with: Date.today.to_s
  fill_in "workout_minutes_elapsed", with: "60"
  fill_in "workout_units_completed", with: "5"
  select "mi", from: "workout_unit_of_measure"
end

When /^I incorrectly fill in the workouts form$/ do
  select Activity.first.name, from: "workout_activity_id"
  select "mi", from: "workout_unit_of_measure"
end

When /^I press "(.*?)"$/ do |button|
  click_button button
end

Then /^I (should|should not) see a link to "(.*?)"$/ do |qual, link|
  if qual == "should"
    page.should have_link link
  else
    page.should_not have_link link
  end
end

Then /^I should be on the workouts page$/ do
  assert page.current_path == workouts_path
end

Then /^I should be on the add workouts page$/ do
  assert page.current_path == new_workout_path
end

Then /^I should see "(.*?)"$/ do |content|
  page.should have_content content
end

Then /^there should be (\d+) workout(s?) listed$/ do |number, plural|
  page.should have_css(".workout-listing", :count => number.to_i)
end
