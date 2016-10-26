Feature: Signup

Scenario: If I am signing up, the form should ask me to enter a name and license plate
Given I am on the account page
And I am not logged in
When I click sign up
Then I should see a form that asks for full name, lpn, email, password, schedule
