Feature: Messaging myself

Scenario: I send a message to myself

Given I am on the compose message page
When I enter my own email
And I enter "Yolo" in the subject line
And I click send
Then I should see my inbox with a message with the subject "Yolo"