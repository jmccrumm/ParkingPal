Feature: Sad message

Scenario: Attempting to send message to invalid user

Given user is on compose message page
When user inputs email that is not connected to anyone
Then an error message should show