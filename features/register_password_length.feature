Feature: Ensure password length of registration

Scenario: If you enter a password that is < 6 characters long, you should not be able to register
Given I am on the register page 
When I enter a password
Then it must be at least 6 characters long 
