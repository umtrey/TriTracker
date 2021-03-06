Given /^I am not logged in$/ do
  visit '/'
end

Given /^I am a new user who is logged in$/ do
  email = "test@test.com"
  password = "testpass"
  @user = User.create(email: email, password: password, password_confirmation: password)
  2.times { FactoryGirl.create(:activity) } unless Activity.any?

  visit '/users/sign_in'
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Sign in"
end

When /^I go to \"\/home\"$/ do
  visit '/home'
end

When /^I go to \"\/\"$/ do
  visit '/'
end

Then /^I should be on the login page$/ do
  assert page.current_path == new_user_session_path
end

Then /^I should be on the home page$/ do
  assert page.current_path == home_path
end
