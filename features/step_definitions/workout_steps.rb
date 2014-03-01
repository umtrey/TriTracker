When /^I click on "(.*?)"$/ do |link|
  click_link link
end

When /^I go to \"\/workouts\"$/ do
  visit '/workouts'
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

Then /^I should see "(.*?)"$/ do |content|
  page.should have_content content
end
