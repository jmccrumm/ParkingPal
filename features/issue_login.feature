Feature: Error, preventing user from logging in with correct credintials

Scenario: I am a registered user but cannot login
Given I am on the login page
When I enter valid credentials
Then nothing happens and I cannot login 
