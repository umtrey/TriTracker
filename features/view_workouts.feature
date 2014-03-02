Feature: User workout viewing
  In order to see the workouts I have done
  As a user of Trey's Tri Tracker
  I want to be able to see a list of workout details

  Scenario: Link on home page
    Given I am a new user who is logged in
    When I go to "/home"
    Then I should see a link to "My Workouts"
    And I should see a link to "Add Workout"

  Scenario: No link on main page
    Given I am not logged in
    When I go to "/"
    Then I should not see a link to "My Workouts"
    And I should not see a link to "Add Workout"

  Scenario: Visiting link
    Given I am a new user who is logged in
    When I go to "/home"
    And I click on "My Workouts"
    Then I should be on the workouts page

  Scenario: Going to workouts page without being logged in
    Given I am not logged in
    When I go to "/workouts"
    Then I should be on the login page
    And I should see "You need to sign in"

  Scenario: Going to add workouts page without being logged in
    Given I am not logged in
    When I go to "/workouts/new"
    Then I should be on the login page
    And I should see "You need to sign in"

  Scenario: Going back to home from workouts page
    Given I am a new user who is logged in
    When I go to "/workouts"
    And I click on "Home"
    Then I should be on the home page

  Scenario: Viewing all workouts
    Given I am a new user who is logged in
    And I have 5 workouts
    When I go to "/workouts"
    Then there should be 5 workouts listed

  Scenario: Adding new workout
    Given I am a new user who is logged in
    When I go to "/home"
    And I click on "Add Workout"
    Then I should be on the add workouts page
    When I fill in the workouts form
    And I press "Save Workout"
    Then I should be on the workouts page
    And I should see "Workout added!"
    And there should be 1 workout listed

  Scenario: Adding a bad workout
    Given I am a new user who is logged in
    When I go to "/workouts/new"
    And I incorrectly fill in the workouts form
    And I press "Save Workout"
    Then I should see "2 errors"
    When I go to "/workouts"
    Then there should be 0 workouts listed
