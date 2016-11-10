Feature: Messaging another user

Scenario: Asking a friend when they are going to leave their spot

Given User is logged in
And A taken parking spot
When I click the message icon
Then I should see a text box to type arbitrary text in and send
