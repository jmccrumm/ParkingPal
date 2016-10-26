Feature: Create Account

Scenario: When using app, I should register
Given I'm on the signup page
When I fill in ALL the fields
And click register 

Then I should get a page that displays my name, car type, plates (ID), and input my class schedule. 
