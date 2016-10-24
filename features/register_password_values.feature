Feature: allow the all characters to be used in password

Scenario: If I enter any combination of symbols, chars, and numbers, the password should be accepted as valid
Given I am on the register page
When I enter a password
Then it will be accepted as long as it is a minimum of 6
