Feature: Failed to register on valid credintials

Scenario: Entering valid information results in an error
Given I am on the register page
Given I enter valid information
When I click submit
Then I expect to recieve an error
