Feature: Home page navigation
  In order to be a user of TriTracker
  As a visitor to the site
  I want to be able to visit the pages of the site

  Scenario: Home Page Access Without Login
    Given I am not logged in
    When I go to "/home"
    Then I should be on the login page

  Scenario: Home Page Access With Login
    Given I am a new user who is logged in
    When I go to "/home"
    Then I should be on the home page
    And I should see a link to "Home"

  Scenario: Front Page Access With Login
    Given I am a new user who is logged in
    When I go to "/"
    Then I should be on the home page
