Feature: Failed to register on valid credintials

Scenario: Entering valid information results in an error

Given I am on the register page
When I don't enter a password
And I click Sign up
Then I should recieve an error
