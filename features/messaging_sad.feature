Feature: Cannot Message other user 

Scenario: Messaging a friend, but cannot. 

Given User is signed in 
And on a parking spot
When I click the message icon
Then I do not see text box with input fields